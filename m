Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4ABB6B03A0
	for <lists+linux-usb@lfdr.de>; Wed, 11 Sep 2019 20:27:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730112AbfIKS1i (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Sep 2019 14:27:38 -0400
Received: from mx2.suse.de ([195.135.220.15]:60952 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729758AbfIKS1h (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 11 Sep 2019 14:27:37 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 4C5E7AF23;
        Wed, 11 Sep 2019 18:27:36 +0000 (UTC)
Message-ID: <1568226447.11279.8.camel@suse.com>
Subject: Re: ttyACM and BREAK chars ?
From:   Oliver Neukum <oneukum@suse.com>
To:     Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Date:   Wed, 11 Sep 2019 20:27:27 +0200
In-Reply-To: <24612ff3f7cd87642a3ab298950be31f8945fcc2.camel@infinera.com>
References: <f7e55901a096024af2d77ae7838df3b658f2c28d.camel@infinera.com>
         <1568211729.11279.6.camel@suse.com>
         <24612ff3f7cd87642a3ab298950be31f8945fcc2.camel@infinera.com>
Content-Type: multipart/mixed; boundary="=-nH//Ggiag1U73RN91wPd"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--=-nH//Ggiag1U73RN91wPd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Am Mittwoch, den 11.09.2019, 14:34 +0000 schrieb Joakim Tjernlund:
> On Wed, 2019-09-11 at 16:22 +0200, Oliver Neukum wrote:
> > CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you recognize the sender and know the content is safe.
> > 
> > 
> > Am Mittwoch, den 11.09.2019, 12:39 +0000 schrieb Joakim Tjernlund:
> > > Every now and then my ttyACM0 hangs up or sends a BREAK char to my device.
> > > I am trying to make ttyACM ignore incoming(over USB) and not emit
> > > any BREAK automatically using termios (IGN_BRK) but that does not make a difference.
> > > 
> > > Is BREAK handling unimpl. in ttyACM ?
> > 
> > acm_send_break() implements it.
> 
> Yes, I se that funktion but I don't see how one can ignore received BREAKs
> If I set IGN_BRK on /dev/ttyACM0 I expect that every BREAK should just be ignored

Handling breaks looks a bit broken on CDC-ACM.
Could you test the attached patch?

	Regards
		Oliver

--=-nH//Ggiag1U73RN91wPd
Content-Disposition: attachment;
	filename*0=0001-cdc-acm-fix-BREAK-rx-code-path-adding-necessary-call.pat;
	filename*1=ch
Content-Transfer-Encoding: base64
Content-Type: text/x-patch;
	name="0001-cdc-acm-fix-BREAK-rx-code-path-adding-necessary-call.patch";
	charset="UTF-8"

RnJvbSA3NGExNmEwZmRjMDU2NjU5YjA1NDNlYzM3N2I1MWZhMjMxYTQyM2MyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBPbGl2ZXIgTmV1a3VtIDxvbmV1a3VtQHN1c2UuY29tPgpEYXRl
OiBXZWQsIDExIFNlcCAyMDE5IDIwOjE3OjM4ICswMjAwClN1YmplY3Q6IFtQQVRDSF0gY2RjLWFj
bTogZml4IEJSRUFLIHJ4IGNvZGUgcGF0aCBhZGRpbmcgbmVjZXNzYXJ5IGNhbGxzCgpDb3VudGlu
ZyBicmVhayBldmVudHMgaXMgbmljZSBidXQgd2Ugc2hvdWxkIGFjdHVhbGx5IHJlcG9ydCB0aGVt
IHRvCnRoZSB0dHkgbGF5ZXIuCgpGaXhlczogNWE2YTYyYmRiOTI1NyAoImNkYy1hY206IGFkZCBU
SU9DTUlXQUlUIikKU2lnbmVkLW9mZi1ieTogT2xpdmVyIE5ldWt1bSA8b25ldWt1bUBzdXNlLmNv
bT4KLS0tCiBkcml2ZXJzL3VzYi9jbGFzcy9jZGMtYWNtLmMgfCA0ICsrKy0KIDEgZmlsZSBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L3VzYi9jbGFzcy9jZGMtYWNtLmMgYi9kcml2ZXJzL3VzYi9jbGFzcy9jZGMtYWNtLmMKaW5kZXgg
NjJmNGZiOWIzNjJmLi44OWQ5N2Q5NzYzYjAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdXNiL2NsYXNz
L2NkYy1hY20uYworKysgYi9kcml2ZXJzL3VzYi9jbGFzcy9jZGMtYWNtLmMKQEAgLTMxMiw4ICsz
MTIsMTAgQEAgc3RhdGljIHZvaWQgYWNtX3Byb2Nlc3Nfbm90aWZpY2F0aW9uKHN0cnVjdCBhY20g
KmFjbSwgdW5zaWduZWQgY2hhciAqYnVmKQogCQkJYWNtLT5pb2NvdW50LmRzcisrOwogCQlpZiAo
ZGlmZmVyZW5jZSAmIEFDTV9DVFJMX0RDRCkKIAkJCWFjbS0+aW9jb3VudC5kY2QrKzsKLQkJaWYg
KG5ld2N0cmwgJiBBQ01fQ1RSTF9CUkspCisJCWlmIChuZXdjdHJsICYgQUNNX0NUUkxfQlJLKSB7
CiAJCQlhY20tPmlvY291bnQuYnJrKys7CisJCQl0dHlfaW5zZXJ0X2ZsaXBfY2hhcigmYWNtLT5w
b3J0LCAwLCBUVFlfQlJFQUspOworCQl9CiAJCWlmIChuZXdjdHJsICYgQUNNX0NUUkxfUkkpCiAJ
CQlhY20tPmlvY291bnQucm5nKys7CiAJCWlmIChuZXdjdHJsICYgQUNNX0NUUkxfRlJBTUlORykK
LS0gCjIuMTYuNAoK


--=-nH//Ggiag1U73RN91wPd--

