Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65644717D65
	for <lists+linux-usb@lfdr.de>; Wed, 31 May 2023 12:50:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232233AbjEaKub (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 31 May 2023 06:50:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232198AbjEaKua (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 31 May 2023 06:50:30 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 935DA125
        for <linux-usb@vger.kernel.org>; Wed, 31 May 2023 03:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685530229; x=1717066229;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to;
  bh=ETR12/10qSegiRn/y7w2gnZx+6ZKNJglHP8eQ1miMLg=;
  b=iiIMewSFv+LfAHq33DA+ewRCLOmOiyplH334G8iUI5EPG0NwvjfDirkI
   0XzB7io0kERX8hegzzTA3+YFTH75HDabiXdBcR1omoGV0/wOhsbZV5Qbj
   7peDmiz/KiFWJMI57c8jXmK+ylHMZHqD93qgrSORzrJIgHAJSohdcsXwo
   VjKOCNvwyiRDmQP2b+KP4IFtmhzuN4UJicBCEvyfjY3K5S8BUVlRvZfL8
   4WrA48UXiJOIVw/vVFUsn2LEuPluvndXlhXso4uvzCc3aAVWnWsexq/av
   o8GWnbShH5wZ5ShsecAhTzKthwHQntISaQN22DzlNkOKTybSAWKBa+wVT
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="441557168"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208,223";a="441557168"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 03:50:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="739902192"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208,223";a="739902192"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orsmga001.jf.intel.com with ESMTP; 31 May 2023 03:50:27 -0700
Content-Type: multipart/mixed; boundary="------------70crC86klW609WiRCVyygVVs"
Message-ID: <b45b5e8a-756e-fd76-64af-d3e376997a31@linux.intel.com>
Date:   Wed, 31 May 2023 13:51:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Content-Language: en-US
To:     =?UTF-8?Q?Christian_Schaubschl=c3=a4ger?= 
        <christian.schaubschlaeger@gmx.at>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
References: <a45b9989-c9da-bf4e-94c8-3e1341777b4d@gmx.at>
 <20230526123655.GW45886@black.fi.intel.com>
 <0bbb844d-3348-dc28-311a-d4111f8a7f81@linux.intel.com>
 <2d12af30-4a7c-5fb3-fab8-5759296c68ac@gmx.at>
 <20230530105039.GF45886@black.fi.intel.com>
 <d6e7e0d5-0b30-d66c-2ee8-4f0c0caef0b9@gmx.at>
 <20230530121756.GG45886@black.fi.intel.com>
 <a22f8874-c2b3-92a5-e858-b877872e5284@gmx.at>
 <894ba559-9233-4428-69e7-7c0bf5c7556e@gmx.at>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: USB issue on a TB4 controller?
In-Reply-To: <894ba559-9233-4428-69e7-7c0bf5c7556e@gmx.at>
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is a multi-part message in MIME format.
--------------70crC86klW609WiRCVyygVVs
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 30.5.2023 15.40, Christian Schaubschläger wrote:
> Sorry, wrong email format :-/
> 
> Christian
> 
> 
> Am 30.05.23 um 14:38 schrieb Christian Schaubschläger:
>> Hi,
>>
>>>> [    0.029711] Kernel command line: bzImage.efi thunderbolt.dyndbg=+p trace_event=xhci-hcd root=PARTUUID=1761F245-C668-41F5-90E4-5BBF2224097A rootwait  nomodeset ima_appraise=off
>>>> [    0.063715] Failed to enable trace event: xhci-hcd
>>> Could be that it expects the driver to be built-in in that case.
>>
>> Ah, that helps a lot, thanks! ;-)
>>
>> Traces attached: one after a boot in OK state, one after a reboot in failed state, and one after reconnecting the dock's USB cable when it was in failed state before. After reconnecting the cable it works again.
>>
>> Thanks and best regards,
>> Christian
>>

Thanks

Looks like the hub (4-2) in the dock doesn't detect any activity on port4
where the NIC is.

Ok case:

[    2.627736] hub 4-2:1.0: 4 ports detected
[    2.628729] hub 4-2:1.0: power on to power good time: 0ms
[    2.630171] hub 4-2:1.0: enabling power on all ports
...
[    2.737142] usb 4-2-port3: status 0203 change 0010
[    2.737639] usb 4-2-port4: status 0203 change 0010
..
[    2.840430] hub 4-2:1.0: state 7 ports 4 chg 0018 evt 0000

Not ok:

[    2.622108] hub 4-2:1.0: 4 ports detected
[    2.622759] hub 4-2:1.0: power on to power good time: 0ms
[    2.623554] hub 4-2:1.0: enabling power on all ports
..
[    2.729001] usb 4-2-port3: status 0203 change 0010
...
[    2.832393] hub 4-2:1.0: state 7 ports 4 chg 0008 evt 0000


Maybe something goes wrong during link training between hub 4-2 and
the NIC at 4-2.4.

If the link immediately goes to a error state without causing a
connect change event for its port, then I guess  it's possible that hub
driver won't react to this port at all.
  
Attached is a patch that adds more debugging, adds a minimum
"power on to power good" delay, (as hub reports 0ms), and checks port link
states during hub initialization.

Does it help? Could you take logs with that patch applied.

Only dmesg with xhci and usbcore dynamic debug are needed.
xhci traces won't help as issue seems to be between the hub inthe dock and the NIC


diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 97a0f8faea6e..9cb238938afa 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -1134,9 +1134,9 @@ static void hub_activate(struct usb_hub *hub, enum hub_activation_type type)
                 if (status)
                         goto abort;
  
-               if (udev || (portstatus & USB_PORT_STAT_CONNECTION))
-                       dev_dbg(&port_dev->dev, "status %04x change %04x\n",
-                                       portstatus, portchange);
+/*             if (udev || (portstatus & USB_PORT_STAT_CONNECTION)) */
+               dev_dbg(&port_dev->dev, "status %04x change %04x\n",
+                       portstatus, portchange);
  
                 /*
                  * After anything other than HUB_RESUME (i.e., initialization
@@ -1162,10 +1162,11 @@ static void hub_activate(struct usb_hub *hub, enum hub_activation_type type)
                 }
  
                 /* Make sure a warm-reset request is handled by port_event */
-               if (type == HUB_RESUME &&
-                   hub_port_warm_reset_required(hub, port1, portstatus))
+               if ((type == HUB_RESUME || type == HUB_INIT2) &&
+                   hub_port_warm_reset_required(hub, port1, portstatus)) {
+                       dev_dbg(&port_dev->dev, "HUBDBG needs warm reset\n");
                         set_bit(port1, hub->event_bits);
-
+               }
                 /*
                  * Add debounce if USB3 link is in polling/link training state.
                  * Link will automatically transition to Enabled state after
diff --git a/drivers/usb/core/hub.h b/drivers/usb/core/hub.h
index e23833562e4f..ad510dfe49e8 100644
--- a/drivers/usb/core/hub.h
+++ b/drivers/usb/core/hub.h
@@ -157,7 +157,7 @@ static inline unsigned hub_power_on_good_delay(struct usb_hub *hub)
         unsigned delay = hub->descriptor->bPwrOn2PwrGood * 2;
  
         if (!hub->hdev->parent) /* root hub */
-               return delay;
+               return max(delay, 100U);
         else /* Wait at least 100 msec for power to become stable */
                 return max(delay, 100U);
  }


Thanks
Mathias
--------------70crC86klW609WiRCVyygVVs
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-usb-hub-add-debugging-and-DS-port-link-state-checks-.patch"
Content-Disposition: attachment;
 filename*0="0001-usb-hub-add-debugging-and-DS-port-link-state-checks-.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSA0ZjdjYmE5ODcxOGZmMWE2MDc4ZjA1Yzg1YTMwYzEwMzYxODNmODExIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBNYXRoaWFzIE55bWFuIDxtYXRoaWFzLm55bWFuQGxp
bnV4LmludGVsLmNvbT4KRGF0ZTogV2VkLCAzMSBNYXkgMjAyMyAxMjoyNDoyNyArMDMwMApT
dWJqZWN0OiBbUEFUQ0hdIHVzYjogaHViOiBhZGQgZGVidWdnaW5nIGFuZCBEUyBwb3J0IGxp
bmsgc3RhdGUgY2hlY2tzIGR1cmluZwogaW5pdGlhbGl6YXRpb24KCkZvcmNlIGEgMTAwbXMg
bWluaW11bSBwb3dlciBvbiB0byBwb3dlciBnb29kIGRlbGF5IGZvciBodWJzIHRvCmxldCBs
aW5rIHRyYWluaWcgc2V0dGxlLgpTaG93IHBvcnRzdGF0dXMgYW5kIGNoYW5nZSB2YWx1ZXMg
Zm9yIGFsbCBwb3J0cyBkdXJpbmcgaHViIGluaXRpYWxpemF0aW9uCndoZW4gZGVidWdnaW5n
LCBub3QganVzdCBmb3IgcG9ydHMgd2l0aCBhIGNvbm5lY3QgY2hhbmdlLgoKQ2hlY2sgbGlu
ayBzdGF0ZSBmb3IgVVNCIDMueCBwb3J0cyBkdXJpbmlnIGh1YiBpbml0aWFsaXphdGlvbiBp
biBjYXNlCmFueSBwb3J0cyBpcyBzdHVjayBpbiBTUy5JbmFjdGl2ZSBvciBjb21wbGlhbmNl
LCBhbmQgbmVlZHMgYSB3YXJtIHJlc2V0CnRvIHJlY292ZXIuIFNldHRpbmcgdGhlIGV2ZW50
IGJpdCBmb3IgdGhvc2UgcG9ydCBzaG91bGQgYmUgZW5vdWdoIGFzIHBvcnQKZXZlbnQgaGFu
ZGxlciB3aWxsIHdhcm0gcmVzZXQgcG9ydHMgaW4gU1MuSW5hY3RpdmUgb3IgY29tcGxpYW5j
ZSBzdGF0ZS4KCk5PVCBGT1IgVVBTVEVBTSwgZGVidWcgcHVycG9zZSBvbmx5LgoKU2lnbmVk
LW9mZi1ieTogTWF0aGlhcyBOeW1hbiA8bWF0aGlhcy5ueW1hbkBsaW51eC5pbnRlbC5jb20+
Ci0tLQogZHJpdmVycy91c2IvY29yZS9odWIuYyB8IDEzICsrKysrKystLS0tLS0KIGRyaXZl
cnMvdXNiL2NvcmUvaHViLmggfCAgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlv
bnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvY29yZS9o
dWIuYyBiL2RyaXZlcnMvdXNiL2NvcmUvaHViLmMKaW5kZXggOTdhMGY4ZmFlYTZlLi45Y2Iy
Mzg5MzhhZmEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdXNiL2NvcmUvaHViLmMKKysrIGIvZHJp
dmVycy91c2IvY29yZS9odWIuYwpAQCAtMTEzNCw5ICsxMTM0LDkgQEAgc3RhdGljIHZvaWQg
aHViX2FjdGl2YXRlKHN0cnVjdCB1c2JfaHViICpodWIsIGVudW0gaHViX2FjdGl2YXRpb25f
dHlwZSB0eXBlKQogCQlpZiAoc3RhdHVzKQogCQkJZ290byBhYm9ydDsKIAotCQlpZiAodWRl
diB8fCAocG9ydHN0YXR1cyAmIFVTQl9QT1JUX1NUQVRfQ09OTkVDVElPTikpCi0JCQlkZXZf
ZGJnKCZwb3J0X2Rldi0+ZGV2LCAic3RhdHVzICUwNHggY2hhbmdlICUwNHhcbiIsCi0JCQkJ
CXBvcnRzdGF0dXMsIHBvcnRjaGFuZ2UpOworLyoJCWlmICh1ZGV2IHx8IChwb3J0c3RhdHVz
ICYgVVNCX1BPUlRfU1RBVF9DT05ORUNUSU9OKSkgKi8KKwkJZGV2X2RiZygmcG9ydF9kZXYt
PmRldiwgInN0YXR1cyAlMDR4IGNoYW5nZSAlMDR4XG4iLAorCQkJcG9ydHN0YXR1cywgcG9y
dGNoYW5nZSk7CiAKIAkJLyoKIAkJICogQWZ0ZXIgYW55dGhpbmcgb3RoZXIgdGhhbiBIVUJf
UkVTVU1FIChpLmUuLCBpbml0aWFsaXphdGlvbgpAQCAtMTE2MiwxMCArMTE2MiwxMSBAQCBz
dGF0aWMgdm9pZCBodWJfYWN0aXZhdGUoc3RydWN0IHVzYl9odWIgKmh1YiwgZW51bSBodWJf
YWN0aXZhdGlvbl90eXBlIHR5cGUpCiAJCX0KIAogCQkvKiBNYWtlIHN1cmUgYSB3YXJtLXJl
c2V0IHJlcXVlc3QgaXMgaGFuZGxlZCBieSBwb3J0X2V2ZW50ICovCi0JCWlmICh0eXBlID09
IEhVQl9SRVNVTUUgJiYKLQkJICAgIGh1Yl9wb3J0X3dhcm1fcmVzZXRfcmVxdWlyZWQoaHVi
LCBwb3J0MSwgcG9ydHN0YXR1cykpCisJCWlmICgodHlwZSA9PSBIVUJfUkVTVU1FIHx8IHR5
cGUgPT0gSFVCX0lOSVQyKSAmJgorCQkgICAgaHViX3BvcnRfd2FybV9yZXNldF9yZXF1aXJl
ZChodWIsIHBvcnQxLCBwb3J0c3RhdHVzKSkgeworCQkJZGV2X2RiZygmcG9ydF9kZXYtPmRl
diwgIkhVQkRCRyBuZWVkcyB3YXJtIHJlc2V0XG4iKTsKIAkJCXNldF9iaXQocG9ydDEsIGh1
Yi0+ZXZlbnRfYml0cyk7Ci0KKwkJfQogCQkvKgogCQkgKiBBZGQgZGVib3VuY2UgaWYgVVNC
MyBsaW5rIGlzIGluIHBvbGxpbmcvbGluayB0cmFpbmluZyBzdGF0ZS4KIAkJICogTGluayB3
aWxsIGF1dG9tYXRpY2FsbHkgdHJhbnNpdGlvbiB0byBFbmFibGVkIHN0YXRlIGFmdGVyCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9jb3JlL2h1Yi5oIGIvZHJpdmVycy91c2IvY29yZS9o
dWIuaAppbmRleCBlMjM4MzM1NjJlNGYuLmFkNTEwZGZlNDllOCAxMDA2NDQKLS0tIGEvZHJp
dmVycy91c2IvY29yZS9odWIuaAorKysgYi9kcml2ZXJzL3VzYi9jb3JlL2h1Yi5oCkBAIC0x
NTcsNyArMTU3LDcgQEAgc3RhdGljIGlubGluZSB1bnNpZ25lZCBodWJfcG93ZXJfb25fZ29v
ZF9kZWxheShzdHJ1Y3QgdXNiX2h1YiAqaHViKQogCXVuc2lnbmVkIGRlbGF5ID0gaHViLT5k
ZXNjcmlwdG9yLT5iUHdyT24yUHdyR29vZCAqIDI7CiAKIAlpZiAoIWh1Yi0+aGRldi0+cGFy
ZW50KQkvKiByb290IGh1YiAqLwotCQlyZXR1cm4gZGVsYXk7CisJCXJldHVybiBtYXgoZGVs
YXksIDEwMFUpOwogCWVsc2UgLyogV2FpdCBhdCBsZWFzdCAxMDAgbXNlYyBmb3IgcG93ZXIg
dG8gYmVjb21lIHN0YWJsZSAqLwogCQlyZXR1cm4gbWF4KGRlbGF5LCAxMDBVKTsKIH0KLS0g
CjIuMjUuMQoK

--------------70crC86klW609WiRCVyygVVs--
