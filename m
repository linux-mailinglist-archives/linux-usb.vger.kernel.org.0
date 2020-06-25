Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A3D4209C55
	for <lists+linux-usb@lfdr.de>; Thu, 25 Jun 2020 11:56:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389568AbgFYJ4j (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Jun 2020 05:56:39 -0400
Received: from mx2.suse.de ([195.135.220.15]:56974 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388485AbgFYJ4j (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 25 Jun 2020 05:56:39 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 76C50AD63;
        Thu, 25 Jun 2020 09:56:36 +0000 (UTC)
Message-ID: <1593078968.28236.15.camel@suse.com>
Subject: Re: [PATCH] USB: cdc-wdm: Call wake_up_all() when clearing
 WDM_IN_USE bit.
From:   Oliver Neukum <oneukum@suse.com>
To:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     Andrey Konovalov <andreyknvl@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Colin Ian King <colin.king@canonical.com>,
        Arnd Bergmann <arnd@arndb.de>,
        USB list <linux-usb@vger.kernel.org>,
        syzbot <syzbot+854768b99f19e89d7f81@syzkaller.appspotmail.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Date:   Thu, 25 Jun 2020 11:56:08 +0200
In-Reply-To: <0c43caf8-1135-1d38-cb57-9c0f84c4394d@i-love.sakura.ne.jp>
References: <1590408381.2838.4.camel@suse.com>
         <4a686d9a-d09f-44f3-553c-bcf0bd8a8ea1@i-love.sakura.ne.jp>
         <082ae642-0703-6c26-39f6-d725e395ef9a@i-love.sakura.ne.jp>
         <CAAeHK+ww0YLUKGjQF5KfzoUUsdfLJdv5guUXRq4q46VfPiQubQ@mail.gmail.com>
         <27b7545e-8f41-10b8-7c02-e35a08eb1611@i-love.sakura.ne.jp>
         <CAAeHK+ww0u0G94z_Y7VXLCVTQVZ9thO0q69n+Fj3jKT6MtpPng@mail.gmail.com>
         <20200528194057.GA21709@rowland.harvard.edu>
         <CAAeHK+ySAnU03cvg1=+yHh0YK1UFO4mrv-N9FcDDMt_0AfGZSQ@mail.gmail.com>
         <20200528205807.GB21709@rowland.harvard.edu>
         <1590852311.14886.3.camel@suse.com>
         <20200530154728.GB29298@rowland.harvard.edu>
         <0c43caf8-1135-1d38-cb57-9c0f84c4394d@i-love.sakura.ne.jp>
Content-Type: multipart/mixed; boundary="=-lZ1fWI96+SWigSLwSPlF"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--=-lZ1fWI96+SWigSLwSPlF
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Am Montag, den 08.06.2020, 11:24 +0900 schrieb Tetsuo Handa:

Hi,

sorry for being late in reply. I have had an emergency to take
care of.

> On 2020/05/31 0:47, Alan Stern wrote:
> > On Sat, May 30, 2020 at 05:25:11PM +0200, Oliver Neukum wrote:
> > > Am Donnerstag, den 28.05.2020, 16:58 -0400 schrieb Alan Stern:

> > > > This sounds like a bug in the driver.  What would it do if someone had a 
> > > 
> > > Arguably yes. I will introduce a timeout. Unfortunately flush()
> > > requires a non-interruptible sleep, as you cannot sanely return EAGAIN.
> > 
> > But maybe you can kill some URBs and drop some data.
> 
> You mean call usb_kill_urb() via kill_urbs() ?

I have to correct myself. We can return -EINTR.
But that is no solution ultimately. We could not close the fd,
though we would not hang.

> As far as I tested, it seems that usb_kill_urb() sometimes fails to call
> wdm_out_callback() despite the comment for usb_kill_urb() says
> 
>  * This routine cancels an in-progress request.  It is guaranteed that
>  * upon return all completion handlers will have finished and the URB
>  * will be totally idle and available for reuse.  These features make
>  * this an ideal way to stop I/O in a disconnect() callback or close()
>  * function.  If the request has not already finished or been unlinked
>  * the completion handler will see urb->status == -ENOENT.

It looks like it does exactly as the description says. Cancelling
an URB is by necessity a race condition. It can always finish
before you can kill it.

> . Is something still wrong? Or just replacing
> 
> 		BUG_ON(test_bit(WDM_IN_USE, &desc->flags) &&
> 		       !test_bit(WDM_DISCONNECTING, &desc->flags));
> 
> with
> 
> 		wait_event(desc->wait, !test_bit(WDM_IN_USE, &desc->flags) ||
> 			   test_bit(WDM_DISCONNECTING, &desc->flags));
> 
> in the patch shown below is sufficient?
> 
> diff --git a/drivers/usb/class/cdc-wdm.c b/drivers/usb/class/cdc-wdm.c
> index e3db6fbeadef..3e92e79ce0a0 100644
> --- a/drivers/usb/class/cdc-wdm.c
> +++ b/drivers/usb/class/cdc-wdm.c
> @@ -151,7 +151,7 @@ static void wdm_out_callback(struct urb *urb)
>  	kfree(desc->outbuf);
>  	desc->outbuf = NULL;
>  	clear_bit(WDM_IN_USE, &desc->flags);
> -	wake_up(&desc->wait);
> +	wake_up_all(&desc->wait);
>  }
>  
>  static void wdm_in_callback(struct urb *urb)
> @@ -424,6 +424,7 @@ static ssize_t wdm_write
>  	if (rv < 0) {
>  		desc->outbuf = NULL;
>  		clear_bit(WDM_IN_USE, &desc->flags);
> +		wake_up_all(&desc->wait);
>  		dev_err(&desc->intf->dev, "Tx URB error: %d\n", rv);
>  		rv = usb_translate_errors(rv);
>  		goto out_free_mem_pm;
> @@ -587,15 +588,16 @@ static int wdm_flush(struct file *file, fl_owner_t id)
>  {
>  	struct wdm_device *desc = file->private_data;
>  
> -	wait_event(desc->wait,
> -			/*
> -			 * needs both flags. We cannot do with one
> -			 * because resetting it would cause a race
> -			 * with write() yet we need to signal
> -			 * a disconnect
> -			 */
> -			!test_bit(WDM_IN_USE, &desc->flags) ||
> -			test_bit(WDM_DISCONNECTING, &desc->flags));
> +	/*
> +	 * needs both flags. We cannot do with one because resetting it would
> +	 * cause a race with write() yet we need to signal a disconnect
> +	 */
> +	if (!wait_event_timeout(desc->wait, !test_bit(WDM_IN_USE, &desc->flags) ||
> +				test_bit(WDM_DISCONNECTING, &desc->flags), 20 * HZ)) {
> +		kill_urbs(desc);

No. We cannot just kill all URBs just because one fd's owner wants to
flush.

In fact we have multiple code paths that can reach the same hang.
Could you test the attached patches?

	Regards
		Oliver

--=-lZ1fWI96+SWigSLwSPlF
Content-Disposition: attachment; filename="0001-CDC-WDM-fix-hangs-in-flush.patch"
Content-Transfer-Encoding: base64
Content-Type: text/x-patch; name="0001-CDC-WDM-fix-hangs-in-flush.patch";
	charset="UTF-8"

RnJvbSAyN2NkMmUyNWIzN2FmOTczYjYxYjc3MjE3ZmEyZGFkODIyODg5ZmY4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBPbGl2ZXIgTmV1a3VtIDxvbmV1a3VtQHN1c2UuY29tPgpEYXRl
OiBXZWQsIDI0IEp1biAyMDIwIDEwOjUyOjAzICswMjAwClN1YmplY3Q6IFtQQVRDSCAxLzJdIENE
Qy1XRE06IGZpeCBoYW5ncyBpbiBmbHVzaCgpCgpXaGVuIGZsdXNoaW5nIGEgdGFzayBuZWVkcyB0
byB3YWl0IGEgYm91bmRlZCB0aW1lLCBhcyBhIGhhcmR3YXJlIGZhaWx1cmUKY291bGQgbWVhbiBl
dGVybmFsIHNsZWVwLiBTbyBhbiBhcmJpdHJhcnkgdGltZW91dCBpcyBpbnRyb2R1Y2VkLgpTaW1w
bHkgbWFraW5nIHRoZSBzeXNjYWxsIGludGVycnVwdGlibGUgd2lsbCBub3QgZG8gdGhlIGpvYiwK
YXMgd2hpbGUgdGhlIHN5c2NhbGwgd291bGQgbm90IGhhbmcsIHRoZSBmZCB3b3VsZCBiZSB1bmNs
b3NhYmxlLgoKSW4gYWRkaXRpb24gYSBmbHVzaCgpIGFuZCBhIHdyaXRlKCkgbWF5IGJlIHdhaXRp
bmcgZm9yIHRoZSBzYW1lCklPIHRvIGNvbXBsZXRlLiBIZW5jZSBjb21wbGV0aW9uIG9mIG91dHB1
dCBtdXN0IHVzZSB3YWtlX3VwX2FsbCgpLApldmVuIGluIGVycm9yIGhhbmRsaW5nLgoKUmVwb3J0
ZWQtYnk6IFRldHN1byBIYW5kYSA8cGVuZ3Vpbi1rZXJuZWxASS1sb3ZlLlNBS1VSQS5uZS5qcD4K
U2lnbmVkLW9mZi1ieTogT2xpdmVyIE5ldWt1bSA8b25ldWt1bUBzdXNlLmNvbT4KLS0tCiBkcml2
ZXJzL3VzYi9jbGFzcy9jZGMtd2RtLmMgfCAyNCArKysrKysrKysrKysrKysrKysrKystLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvdXNiL2NsYXNzL2NkYy13ZG0uYyBiL2RyaXZlcnMvdXNiL2NsYXNzL2NkYy13
ZG0uYwppbmRleCBlM2RiNmZiZWFkZWYuLmVjNTQxMjc3M2M1NyAxMDA2NDQKLS0tIGEvZHJpdmVy
cy91c2IvY2xhc3MvY2RjLXdkbS5jCisrKyBiL2RyaXZlcnMvdXNiL2NsYXNzL2NkYy13ZG0uYwpA
QCAtNTgsNiArNTgsOSBAQCBNT0RVTEVfREVWSUNFX1RBQkxFICh1c2IsIHdkbV9pZHMpOwogCiAj
ZGVmaW5lIFdETV9NQVgJCQkxNgogCisvKiBmbHVzaCgpIG5lZWRzIHRvIGJlIHVuaW50ZXJydXB0
aWJsZSwgYnV0IHdlIGNhbm5vdCB3YWl0IGZvcmV2ZXIgKi8KKyNkZWZpbmUgV0RNX0ZMVVNIX1RJ
TUVPVVQJKDMwICogSFopCisKIC8qIENEQy1XTUMgcjEuMSByZXF1aXJlcyB3TWF4Q29tbWFuZCB0
byBiZSAiYXQgbGVhc3QgMjU2IGRlY2ltYWwgKDB4MTAwKSIgKi8KICNkZWZpbmUgV0RNX0RFRkFV
TFRfQlVGU0laRQkyNTYKIApAQCAtMTUxLDcgKzE1NCw3IEBAIHN0YXRpYyB2b2lkIHdkbV9vdXRf
Y2FsbGJhY2soc3RydWN0IHVyYiAqdXJiKQogCWtmcmVlKGRlc2MtPm91dGJ1Zik7CiAJZGVzYy0+
b3V0YnVmID0gTlVMTDsKIAljbGVhcl9iaXQoV0RNX0lOX1VTRSwgJmRlc2MtPmZsYWdzKTsKLQl3
YWtlX3VwKCZkZXNjLT53YWl0KTsKKwl3YWtlX3VwX2FsbCgmZGVzYy0+d2FpdCk7CiB9CiAKIHN0
YXRpYyB2b2lkIHdkbV9pbl9jYWxsYmFjayhzdHJ1Y3QgdXJiICp1cmIpCkBAIC00MjQsNiArNDI3
LDcgQEAgc3RhdGljIHNzaXplX3Qgd2RtX3dyaXRlCiAJaWYgKHJ2IDwgMCkgewogCQlkZXNjLT5v
dXRidWYgPSBOVUxMOwogCQljbGVhcl9iaXQoV0RNX0lOX1VTRSwgJmRlc2MtPmZsYWdzKTsKKwkJ
d2FrZV91cF9hbGwoJmRlc2MtPndhaXQpOyAvKiBmb3IgZmx1c2goKSAqLwogCQlkZXZfZXJyKCZk
ZXNjLT5pbnRmLT5kZXYsICJUeCBVUkIgZXJyb3I6ICVkXG4iLCBydik7CiAJCXJ2ID0gdXNiX3Ry
YW5zbGF0ZV9lcnJvcnMocnYpOwogCQlnb3RvIG91dF9mcmVlX21lbV9wbTsKQEAgLTU4Niw4ICs1
OTAsOSBAQCBzdGF0aWMgc3NpemVfdCB3ZG1fcmVhZAogc3RhdGljIGludCB3ZG1fZmx1c2goc3Ry
dWN0IGZpbGUgKmZpbGUsIGZsX293bmVyX3QgaWQpCiB7CiAJc3RydWN0IHdkbV9kZXZpY2UgKmRl
c2MgPSBmaWxlLT5wcml2YXRlX2RhdGE7CisJaW50IHJ2OwogCi0Jd2FpdF9ldmVudChkZXNjLT53
YWl0LAorCXJ2ID0gd2FpdF9ldmVudF9pbnRlcnJ1cHRpYmxlX3RpbWVvdXQoZGVzYy0+d2FpdCwK
IAkJCS8qCiAJCQkgKiBuZWVkcyBib3RoIGZsYWdzLiBXZSBjYW5ub3QgZG8gd2l0aCBvbmUKIAkJ
CSAqIGJlY2F1c2UgcmVzZXR0aW5nIGl0IHdvdWxkIGNhdXNlIGEgcmFjZQpAQCAtNTk1LDExICs2
MDAsMTYgQEAgc3RhdGljIGludCB3ZG1fZmx1c2goc3RydWN0IGZpbGUgKmZpbGUsIGZsX293bmVy
X3QgaWQpCiAJCQkgKiBhIGRpc2Nvbm5lY3QKIAkJCSAqLwogCQkJIXRlc3RfYml0KFdETV9JTl9V
U0UsICZkZXNjLT5mbGFncykgfHwKLQkJCXRlc3RfYml0KFdETV9ESVNDT05ORUNUSU5HLCAmZGVz
Yy0+ZmxhZ3MpKTsKKwkJCXRlc3RfYml0KFdETV9ESVNDT05ORUNUSU5HLCAmZGVzYy0+ZmxhZ3Mp
LAorCQkJV0RNX0ZMVVNIX1RJTUVPVVQpOwogCiAJLyogY2Fubm90IGRlcmVmZXJlbmNlIGRlc2Mt
PmludGYgaWYgV0RNX0RJU0NPTk5FQ1RJTkcgKi8KIAlpZiAodGVzdF9iaXQoV0RNX0RJU0NPTk5F
Q1RJTkcsICZkZXNjLT5mbGFncykpCiAJCXJldHVybiAtRU5PREVWOworCWlmICghcnYpCisJCXJl
dHVybiAtRUlPOworCWlmIChydiA8IDApCisJCXJldHVybiAtRUlOVFI7CiAJaWYgKGRlc2MtPndl
cnIgPCAwKQogCQlkZXZfZXJyKCZkZXNjLT5pbnRmLT5kZXYsICJFcnJvciBpbiBmbHVzaCBwYXRo
OiAlZFxuIiwKIAkJCWRlc2MtPndlcnIpOwpAQCAtNjU2LDYgKzY2NiwxNCBAQCBzdGF0aWMgaW50
IHdkbV9vcGVuKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBmaWxlICpmaWxlKQogCQlnb3Rv
IG91dDsKIAl9CiAKKwkvKgorCSAqIGluIGNhc2UgZmx1c2goKSBoYWQgdGltZWQgb3V0CisJICov
CisJdXNiX2tpbGxfdXJiKGRlc2MtPmNvbW1hbmQpOworCXNwaW5fbG9ja19pcnEoJmRlc2MtPml1
c3Bpbik7CisJZGVzYy0+d2VyciA9IDA7CisJc3Bpbl91bmxvY2tfaXJxKCZkZXNjLT5pdXNwaW4p
OworCiAJLyogdXNpbmcgd3JpdGUgbG9jayB0byBwcm90ZWN0IGRlc2MtPmNvdW50ICovCiAJbXV0
ZXhfbG9jaygmZGVzYy0+d2xvY2spOwogCWlmICghZGVzYy0+Y291bnQrKykgewotLSAKMi4xNi40
Cgo=


--=-lZ1fWI96+SWigSLwSPlF
Content-Disposition: attachment;
	filename="0002-CDC-WDM-fix-race-reporting-errors-in-flush.patch"
Content-Transfer-Encoding: base64
Content-Type: text/x-patch; name="0002-CDC-WDM-fix-race-reporting-errors-in-flush.patch";
	charset="UTF-8"

RnJvbSBkNTg4YjgwMzRiNzM0ZWNjZTA1NzVhZTExMTBkM2FiNWEzODZlMDQ5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBPbGl2ZXIgTmV1a3VtIDxvbmV1a3VtQHN1c2UuY29tPgpEYXRl
OiBUaHUsIDI1IEp1biAyMDIwIDExOjUzOjU0ICswMjAwClN1YmplY3Q6IFtQQVRDSCAyLzJdIENE
Qy1XRE06IGZpeCByYWNlIHJlcG9ydGluZyBlcnJvcnMgaW4gZmx1c2gKCkluIGNhc2UgYSByYWNl
IHdhcyBsb3N0IGFuZCBtdWx0aXBsZSBmZHMgdXNlZCwKYW4gZXJyb3IgY291bGQgYmUgcmVwb3J0
ZWQgbXVsdGlwbGUgdGltZXMuIFRvIGZpeAp0aGlzIGEgc3BpbmxvY2sgbXVzdCBiZSB0YWtlbi4K
ClNpZ25lZC1vZmYtYnk6IE9saXZlciBOZXVrdW0gPG9uZXVrdW1Ac3VzZS5jb20+Ci0tLQogZHJp
dmVycy91c2IvY2xhc3MvY2RjLXdkbS5jIHwgMTMgKysrKysrKysrLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDkgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L3VzYi9jbGFzcy9jZGMtd2RtLmMgYi9kcml2ZXJzL3VzYi9jbGFzcy9jZGMtd2RtLmMKaW5kZXgg
ZWM1NDEyNzczYzU3Li5lOWU4Mjc3YTBjNjkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdXNiL2NsYXNz
L2NkYy13ZG0uYworKysgYi9kcml2ZXJzL3VzYi9jbGFzcy9jZGMtd2RtLmMKQEAgLTYxMCwxMSAr
NjEwLDE2IEBAIHN0YXRpYyBpbnQgd2RtX2ZsdXNoKHN0cnVjdCBmaWxlICpmaWxlLCBmbF9vd25l
cl90IGlkKQogCQlyZXR1cm4gLUVJTzsKIAlpZiAocnYgPCAwKQogCQlyZXR1cm4gLUVJTlRSOwot
CWlmIChkZXNjLT53ZXJyIDwgMCkKLQkJZGV2X2VycigmZGVzYy0+aW50Zi0+ZGV2LCAiRXJyb3Ig
aW4gZmx1c2ggcGF0aDogJWRcbiIsCi0JCQlkZXNjLT53ZXJyKTsKIAotCXJldHVybiB1c2JfdHJh
bnNsYXRlX2Vycm9ycyhkZXNjLT53ZXJyKTsKKwlzcGluX2xvY2tfaXJxKCZkZXNjLT5pdXNwaW4p
OworCXJ2ID0gZGVzYy0+d2VycjsKKwlkZXNjLT53ZXJyID0gMDsKKwlzcGluX3VubG9ja19pcnEo
JmRlc2MtPml1c3Bpbik7CisKKwlpZiAocnYgPCAwKQorCQlkZXZfZXJyKCZkZXNjLT5pbnRmLT5k
ZXYsICJFcnJvciBpbiBmbHVzaCBwYXRoOiAlZFxuIiwgcnYpOworCisJcmV0dXJuIHVzYl90cmFu
c2xhdGVfZXJyb3JzKHJ2KTsKIH0KIAogc3RhdGljIF9fcG9sbF90IHdkbV9wb2xsKHN0cnVjdCBm
aWxlICpmaWxlLCBzdHJ1Y3QgcG9sbF90YWJsZV9zdHJ1Y3QgKndhaXQpCi0tIAoyLjE2LjQKCg==


--=-lZ1fWI96+SWigSLwSPlF--

