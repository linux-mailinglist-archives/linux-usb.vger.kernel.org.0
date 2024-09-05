Return-Path: <linux-usb+bounces-14706-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E692D96DAD2
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2024 15:50:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 170AB1C2376E
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2024 13:50:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33E9519D899;
	Thu,  5 Sep 2024 13:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K0+EaZcm"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F9E19B589
	for <linux-usb@vger.kernel.org>; Thu,  5 Sep 2024 13:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725544239; cv=none; b=UjSk9VOduS9vXj4HA+ZfzoCMNNZMxWkU/8G4OGV2XpEi3PsPq9fLc+CCSZ6I4LJamTAPKRJ8qS7BAmVHJZNZ/0fyZ7xmZrFoGnQPryh6APyIS0KUSSDHi9xWDaizZWwtSD0vqqw+E2XTQrP9PCyn371QwQzoJW/vsYgVTCQId+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725544239; c=relaxed/simple;
	bh=puLgy12sWloq2rGuZrVjUwWBj7qYs7i29Fd0ulYnQTQ=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=d3sxozIJjduThxKvp4fnIhMatFx8uVU3VBqHQowu6b/e+H+jnge9sfW0jojPYW/pzwHaGkxkAk4DnRREqqNFFIz4JQ6LPBn06y+YB0vkuYyvM7pmSiacmJ1MH9EJwIqhFm4wsXfESvW9JsFkBgJdkQgxKmQ2bGEKJEQpDqTIQhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K0+EaZcm; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725544238; x=1757080238;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to;
  bh=puLgy12sWloq2rGuZrVjUwWBj7qYs7i29Fd0ulYnQTQ=;
  b=K0+EaZcmJ5nD0z+fE893NBmxuDlckrZGv1PeBhkVfSmGZ4h+ElBs1ObP
   FnaZfie7eGzzzQKH0WAcxPwuWBM6wh5Uzycn1+hMSIjOV5Alwj8SznOeU
   DhznWOV885AkEU3kZlkCfL21U9KDc/DEF8xLZOyeWwFdedPcBuZLEBOvi
   c7wRXP8UkMy8Rxkn+2s4Ili9duda/a1K39jPo5cszHtlgV0wbnscDBLdr
   ZivH1ssIpsFgxyNt75mBoMwJp81LioOheulLdv2sML4ufKnDI9Q01bM2D
   v/D2OysV45xXi+xgqt4sk6+mVgRpGZt7yR0tJd6OaGtD+WpgSF1cBgvqj
   Q==;
X-CSE-ConnectionGUID: L4KTMgyeSgix10CH0Nn02Q==
X-CSE-MsgGUID: D1vzYJy+Swub21fPWK/mVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="41763650"
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; 
   d="scan'208,223";a="41763650"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 06:50:37 -0700
X-CSE-ConnectionGUID: w9E8PCBjQGmS7/GsemiEcg==
X-CSE-MsgGUID: bSrvSJN3QQ6asXQReKUYag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; 
   d="scan'208,223";a="70219113"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmviesa004.fm.intel.com with ESMTP; 05 Sep 2024 06:50:36 -0700
Content-Type: multipart/mixed; boundary="------------BhpMM4pGuBIqa30YlFTD00A0"
Message-ID: <e16c21cd-41f3-4191-9957-6e61ddfefd24@linux.intel.com>
Date: Thu, 5 Sep 2024 16:52:41 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Strange issues with UAS URB cancellation
To: Marc SCHAEFER <schaefer@alphanet.ch>
Cc: Micha?? Pecio <michal.pecio@gmail.com>, linux-usb@vger.kernel.org
References: <ZswP0+cLIqkTF0D/@alphanet.ch> <20240903094822.3ae297cb@foxbook>
 <ZtcHOlqlQMMD4LzY@alphanet.ch> <20240903152218.74393a9e@foxbook>
 <ZtcUGe0FWxpO6058@alphanet.ch> <ZtcUq37F6gqgzifm@alphanet.ch>
 <ZtcVXoI6jNM9Lqbl@alphanet.ch> <20240903174535.6e5e581b@foxbook>
 <ZtdmOiKN6hb2Y82I@alphanet.ch>
 <71c073de-8af5-4457-88eb-91a709c2d941@linux.intel.com>
 <ZtiMp39CWrI0e+GB@alphanet.ch>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <ZtiMp39CWrI0e+GB@alphanet.ch>

This is a multi-part message in MIME format.
--------------BhpMM4pGuBIqa30YlFTD00A0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4.9.2024 19.36, Marc SCHAEFER wrote:
> Hello,
> 
> On Wed, Sep 04, 2024 at 05:26:28PM +0300, Mathias Nyman wrote:
>> I can start working on some debugging patches as well if you have the time to try
> 
> Yes, with pleasure.  I often have time to recompile stuff, and I can leave the test
> system running.

Thanks, testpatch below, and also as attachment.

8<---

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index efdf4c228b8c..b5f97f75a5ff 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1749,14 +1749,14 @@ static int xhci_urb_dequeue(struct usb_hcd *hcd, struct urb *urb, int status)
  
         i = urb_priv->num_tds_done;
         if (i < urb_priv->num_tds)
-               xhci_dbg_trace(xhci, trace_xhci_dbg_cancel_urb,
-                               "Cancel URB %p, dev %s, ep 0x%x, "
-                               "starting at offset 0x%llx",
-                               urb, urb->dev->devpath,
-                               urb->ep->desc.bEndpointAddress,
-                               (unsigned long long) xhci_trb_virt_to_dma(
-                                       urb_priv->td[i].start_seg,
-                                       urb_priv->td[i].first_trb));
+               xhci_warn(xhci,
+                         "Cancel URB %p, dev %s, ep 0x%x, stream_id %u starting at offset 0x%llx",
+                         urb, urb->dev->devpath,
+                         urb->ep->desc.bEndpointAddress,
+                         urb->stream_id,
+                         (unsigned long long) xhci_trb_virt_to_dma(
+                                 urb_priv->td[i].start_seg,
+                                 urb_priv->td[i].first_trb));
  
         for (; i < urb_priv->num_tds; i++) {
                 td = &urb_priv->td[i];
(END)
+       char str[XHCI_MSG_MAX];
  
         ep_index = TRB_TO_EP_INDEX(le32_to_cpu(trb->generic.field[3]));
         stream_id = TRB_TO_STREAM_ID(le32_to_cpu(trb->generic.field[2]));
@@ -1351,6 +1352,11 @@ static void xhci_handle_cmd_set_deq(struct xhci_hcd *xhci, int slot_id,
         if (!ep_ring) {
                 xhci_warn(xhci, "WARN Set TR deq ptr command for freed stream ID %u\n",
                                 stream_id);
+               xhci_warn(xhci, "MN: %s\n" ,
+                            xhci_decode_trb(str, XHCI_MSG_MAX, le32_to_cpu(trb->generic.field[0]),
+                                           le32_to_cpu(trb->generic.field[1]),
+                                           le32_to_cpu(trb->generic.field[2]),
+                                          le32_to_cpu(trb->generic.field[3])));
                 /* XXX: Harmless??? */
                 goto cleanup;
         }
@@ -1386,6 +1392,12 @@ static void xhci_handle_cmd_set_deq(struct xhci_hcd *xhci, int slot_id,
                                         cmd_comp_code);
                         break;
                 }
+               xhci_warn(xhci, "MN: %s\n",
+                         xhci_decode_trb(str, XHCI_MSG_MAX, le32_to_cpu(trb->generic.field[0]),
+                                         le32_to_cpu(trb->generic.field[1]),
+                                         le32_to_cpu(trb->generic.field[2]),
+                                         le32_to_cpu(trb->generic.field[3])));
+
                 /* OK what do we do now?  The endpoint state is hosed, and we
                  * should never get to this point if the synchronization between
                  * queueing, and endpoint state are correct.  This might happen
@@ -2864,6 +2876,12 @@ static int handle_tx_event(struct xhci_hcd *xhci,
                                         trb_comp_code);
                                 trb_in_td(xhci, td, ep_trb_dma, true);
  
+                               if (xhci_halted_host_endpoint(ep_ctx, trb_comp_code)) {
+                                       xhci_err(xhci, "MN: No TD found, fix halted ep");
+                                       xhci_handle_halted_endpoint(xhci, ep, NULL, EP_HARD_RESET);
+                               } else {
+                                       xhci_err(xhci, "MN: No TD found, ep not halted");
+                               }
                                 return -ESHUTDOWN;
                         }
                 }
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index efdf4c228b8c..b5f97f75a5ff 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1749,14 +1749,14 @@ static int xhci_urb_dequeue(struct usb_hcd *hcd, struct urb *urb, int status)
  
         i = urb_priv->num_tds_done;
         if (i < urb_priv->num_tds)
-               xhci_dbg_trace(xhci, trace_xhci_dbg_cancel_urb,
-                               "Cancel URB %p, dev %s, ep 0x%x, "
-                               "starting at offset 0x%llx",
-                               urb, urb->dev->devpath,
-                               urb->ep->desc.bEndpointAddress,
-                               (unsigned long long) xhci_trb_virt_to_dma(
-                                       urb_priv->td[i].start_seg,
-                                       urb_priv->td[i].first_trb));
+               xhci_warn(xhci,
+                         "Cancel URB %p, dev %s, ep 0x%x, stream_id %u starting at offset 0x%llx",
+                         urb, urb->dev->devpath,
+                         urb->ep->desc.bEndpointAddress,
+                         urb->stream_id,
+                         (unsigned long long) xhci_trb_virt_to_dma(
+                                 urb_priv->td[i].start_seg,
+                                 urb_priv->td[i].first_trb));
  
         for (; i < urb_priv->num_tds; i++) {
                 td = &urb_priv->td[i];

--------------BhpMM4pGuBIqa30YlFTD00A0
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-xhci-Debug-patch-handle-halted-ep-if-TD-is-not-found.patch"
Content-Disposition: attachment;
 filename*0="0001-xhci-Debug-patch-handle-halted-ep-if-TD-is-not-found.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSBiZjdiYmY4ZGJmOTJkYzA2ZTEwOGExMDNmNWYwMWIzZjQxNjMzOWRhIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBNYXRoaWFzIE55bWFuIDxtYXRoaWFzLm55bWFuQGxp
bnV4LmludGVsLmNvbT4KRGF0ZTogVGh1LCA1IFNlcCAyMDI0IDE2OjIwOjIyICswMzAwClN1
YmplY3Q6IFtQQVRDSF0geGhjaTogRGVidWcgcGF0Y2g6IGhhbmRsZSBoYWx0ZWQgZXAgaWYg
VEQgaXMgbm90IGZvdW5kLgoKQSBob3N0IHNpZGUgaGFsdGVkIGVuZHBvaW50IG1heSBub3Qg
YmUgcmVjb3ZlcmVkIGlmIHRoZSBCYWJibGUgZXJyb3IKZXZlbnQgZG9lcyBub3QgcG9pbnQg
dG8gYW55IHBlbmRpbmcgIHRyYW5mZXIgZGVzY3JpcHRvciAoVEQpLgoKSGFuZGxlIGhhbHRl
ZCBlbmRwb2ludCBldmVudCBpZiB0cmFuc2ZlciBldmVudCBkb2VzIG5vdCBwb2ludCB0bwph
bnkgcGVuZGluZyBURC4gVGhlIEJhYmJsZSBlcnJvciBtYXkgaGF2ZSBiZWVuIGZvciBhIFRE
IHRoYXQgaGFzIGFscmVhZHkKYmVlbiBnaXZlbiBiYWNrLgoKQWtsc28gYWRkIGRlYnVpZ2dv
aW5nIGZvciBUUkJfRVJST1IgaXNzdWVzIHNlZW4gd2hlbiBxdWV1aW5nIGEKU2V0IFRSIERl
cSBwb2ludGVyIGNvbW1hbmQKClNpZ25lZC1vZmYtYnk6IE1hdGhpYXMgTnltYW4gPG1hdGhp
YXMubnltYW5AbGludXguaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvdXNiL2hvc3QveGhjaS1y
aW5nLmMgfCAyMCArKysrKysrKysrKysrKysrKysrLQogZHJpdmVycy91c2IvaG9zdC94aGNp
LmMgICAgICB8IDE2ICsrKysrKysrLS0tLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMjcgaW5z
ZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9o
b3N0L3hoY2ktcmluZy5jIGIvZHJpdmVycy91c2IvaG9zdC94aGNpLXJpbmcuYwppbmRleCA0
ZWEyYzNlMDcyYTkuLjRlZThiMmI0MmFjNSAxMDA2NDQKLS0tIGEvZHJpdmVycy91c2IvaG9z
dC94aGNpLXJpbmcuYworKysgYi9kcml2ZXJzL3VzYi9ob3N0L3hoY2ktcmluZy5jCkBAIC0x
MDA4LDcgKzEwMDgsNyBAQCBzdGF0aWMgaW50IHhoY2lfaW52YWxpZGF0ZV9jYW5jZWxsZWRf
dGRzKHN0cnVjdCB4aGNpX3ZpcnRfZXAgKmVwKQogCQkJCWlmIChjYWNoZWRfdGQpIHsKIAkJ
CQkJaWYgKGNhY2hlZF90ZC0+dXJiLT5zdHJlYW1faWQgIT0gdGQtPnVyYi0+c3RyZWFtX2lk
KSB7CiAJCQkJCQkvKiBNdWx0aXBsZSBzdHJlYW1zIGNhc2UsIGRlZmVyIG1vdmUgZHEgKi8K
LQkJCQkJCXhoY2lfZGJnKHhoY2ksCisJCQkJCQl4aGNpX3dhcm4oeGhjaSwKIAkJCQkJCQkg
Ik1vdmUgZHEgZGVmZXJyZWQ6IHN0cmVhbSAldSBVUkIgJXBcbiIsCiAJCQkJCQkJIHRkLT51
cmItPnN0cmVhbV9pZCwgdGQtPnVyYik7CiAJCQkJCQl0ZC0+Y2FuY2VsX3N0YXR1cyA9IFRE
X0NMRUFSSU5HX0NBQ0hFX0RFRkVSUkVEOwpAQCAtMTM0MCw2ICsxMzQwLDcgQEAgc3RhdGlj
IHZvaWQgeGhjaV9oYW5kbGVfY21kX3NldF9kZXEoc3RydWN0IHhoY2lfaGNkICp4aGNpLCBp
bnQgc2xvdF9pZCwKIAlzdHJ1Y3QgeGhjaV9zbG90X2N0eCAqc2xvdF9jdHg7CiAJc3RydWN0
IHhoY2lfdGQgKnRkLCAqdG1wX3RkOwogCWJvb2wgZGVmZXJyZWQgPSBmYWxzZTsKKwljaGFy
IHN0cltYSENJX01TR19NQVhdOwogCiAJZXBfaW5kZXggPSBUUkJfVE9fRVBfSU5ERVgobGUz
Ml90b19jcHUodHJiLT5nZW5lcmljLmZpZWxkWzNdKSk7CiAJc3RyZWFtX2lkID0gVFJCX1RP
X1NUUkVBTV9JRChsZTMyX3RvX2NwdSh0cmItPmdlbmVyaWMuZmllbGRbMl0pKTsKQEAgLTEz
NTEsNiArMTM1MiwxMSBAQCBzdGF0aWMgdm9pZCB4aGNpX2hhbmRsZV9jbWRfc2V0X2RlcShz
dHJ1Y3QgeGhjaV9oY2QgKnhoY2ksIGludCBzbG90X2lkLAogCWlmICghZXBfcmluZykgewog
CQl4aGNpX3dhcm4oeGhjaSwgIldBUk4gU2V0IFRSIGRlcSBwdHIgY29tbWFuZCBmb3IgZnJl
ZWQgc3RyZWFtIElEICV1XG4iLAogCQkJCXN0cmVhbV9pZCk7CisJCXhoY2lfd2Fybih4aGNp
LCAiTU46ICVzXG4iICwKKwkJCSAgICAgeGhjaV9kZWNvZGVfdHJiKHN0ciwgWEhDSV9NU0df
TUFYLCBsZTMyX3RvX2NwdSh0cmItPmdlbmVyaWMuZmllbGRbMF0pLAorICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxlMzJfdG9fY3B1KHRyYi0+Z2VuZXJp
Yy5maWVsZFsxXSksCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgbGUzMl90b19jcHUodHJiLT5nZW5lcmljLmZpZWxkWzJdKSwKKwkgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGxlMzJfdG9fY3B1KHRyYi0+Z2VuZXJpYy5maWVsZFsz
XSkpKTsKIAkJLyogWFhYOiBIYXJtbGVzcz8/PyAqLwogCQlnb3RvIGNsZWFudXA7CiAJfQpA
QCAtMTM4Niw2ICsxMzkyLDEyIEBAIHN0YXRpYyB2b2lkIHhoY2lfaGFuZGxlX2NtZF9zZXRf
ZGVxKHN0cnVjdCB4aGNpX2hjZCAqeGhjaSwgaW50IHNsb3RfaWQsCiAJCQkJCWNtZF9jb21w
X2NvZGUpOwogCQkJYnJlYWs7CiAJCX0KKwkJeGhjaV93YXJuKHhoY2ksICJNTjogJXNcbiIs
CisJCQkgIHhoY2lfZGVjb2RlX3RyYihzdHIsIFhIQ0lfTVNHX01BWCwgbGUzMl90b19jcHUo
dHJiLT5nZW5lcmljLmZpZWxkWzBdKSwKKwkJCQkJICBsZTMyX3RvX2NwdSh0cmItPmdlbmVy
aWMuZmllbGRbMV0pLAorCQkJCQkgIGxlMzJfdG9fY3B1KHRyYi0+Z2VuZXJpYy5maWVsZFsy
XSksCisJCQkJCSAgbGUzMl90b19jcHUodHJiLT5nZW5lcmljLmZpZWxkWzNdKSkpOworCiAJ
CS8qIE9LIHdoYXQgZG8gd2UgZG8gbm93PyAgVGhlIGVuZHBvaW50IHN0YXRlIGlzIGhvc2Vk
LCBhbmQgd2UKIAkJICogc2hvdWxkIG5ldmVyIGdldCB0byB0aGlzIHBvaW50IGlmIHRoZSBz
eW5jaHJvbml6YXRpb24gYmV0d2VlbgogCQkgKiBxdWV1ZWluZywgYW5kIGVuZHBvaW50IHN0
YXRlIGFyZSBjb3JyZWN0LiAgVGhpcyBtaWdodCBoYXBwZW4KQEAgLTI4NjQsNiArMjg3Niwx
MiBAQCBzdGF0aWMgaW50IGhhbmRsZV90eF9ldmVudChzdHJ1Y3QgeGhjaV9oY2QgKnhoY2ks
CiAJCQkJCXRyYl9jb21wX2NvZGUpOwogCQkJCXRyYl9pbl90ZCh4aGNpLCB0ZCwgZXBfdHJi
X2RtYSwgdHJ1ZSk7CiAKKwkJCQlpZiAoeGhjaV9oYWx0ZWRfaG9zdF9lbmRwb2ludChlcF9j
dHgsIHRyYl9jb21wX2NvZGUpKSB7CisJCQkJCXhoY2lfZXJyKHhoY2ksICJNTjogTm8gVEQg
Zm91bmQsIGZpeCBoYWx0ZWQgZXAiKTsKKwkJCQkJeGhjaV9oYW5kbGVfaGFsdGVkX2VuZHBv
aW50KHhoY2ksIGVwLCBOVUxMLCBFUF9IQVJEX1JFU0VUKTsKKwkJCQl9IGVsc2UgeworCQkJ
CQl4aGNpX2Vycih4aGNpLCAiTU46IE5vIFREIGZvdW5kLCBlcCBub3QgaGFsdGVkIik7CisJ
CQkJfQogCQkJCXJldHVybiAtRVNIVVRET1dOOwogCQkJfQogCQl9CmRpZmYgLS1naXQgYS9k
cml2ZXJzL3VzYi9ob3N0L3hoY2kuYyBiL2RyaXZlcnMvdXNiL2hvc3QveGhjaS5jCmluZGV4
IGVmZGY0YzIyOGI4Yy4uYjVmOTdmNzVhNWZmIDEwMDY0NAotLS0gYS9kcml2ZXJzL3VzYi9o
b3N0L3hoY2kuYworKysgYi9kcml2ZXJzL3VzYi9ob3N0L3hoY2kuYwpAQCAtMTc0OSwxNCAr
MTc0OSwxNCBAQCBzdGF0aWMgaW50IHhoY2lfdXJiX2RlcXVldWUoc3RydWN0IHVzYl9oY2Qg
KmhjZCwgc3RydWN0IHVyYiAqdXJiLCBpbnQgc3RhdHVzKQogCiAJaSA9IHVyYl9wcml2LT5u
dW1fdGRzX2RvbmU7CiAJaWYgKGkgPCB1cmJfcHJpdi0+bnVtX3RkcykKLQkJeGhjaV9kYmdf
dHJhY2UoeGhjaSwgdHJhY2VfeGhjaV9kYmdfY2FuY2VsX3VyYiwKLQkJCQkiQ2FuY2VsIFVS
QiAlcCwgZGV2ICVzLCBlcCAweCV4LCAiCi0JCQkJInN0YXJ0aW5nIGF0IG9mZnNldCAweCVs
bHgiLAotCQkJCXVyYiwgdXJiLT5kZXYtPmRldnBhdGgsCi0JCQkJdXJiLT5lcC0+ZGVzYy5i
RW5kcG9pbnRBZGRyZXNzLAotCQkJCSh1bnNpZ25lZCBsb25nIGxvbmcpIHhoY2lfdHJiX3Zp
cnRfdG9fZG1hKAotCQkJCQl1cmJfcHJpdi0+dGRbaV0uc3RhcnRfc2VnLAotCQkJCQl1cmJf
cHJpdi0+dGRbaV0uZmlyc3RfdHJiKSk7CisJCXhoY2lfd2Fybih4aGNpLAorCQkJICAiQ2Fu
Y2VsIFVSQiAlcCwgZGV2ICVzLCBlcCAweCV4LCBzdHJlYW1faWQgJXUgc3RhcnRpbmcgYXQg
b2Zmc2V0IDB4JWxseCIsCisJCQkgIHVyYiwgdXJiLT5kZXYtPmRldnBhdGgsCisJCQkgIHVy
Yi0+ZXAtPmRlc2MuYkVuZHBvaW50QWRkcmVzcywKKwkJCSAgdXJiLT5zdHJlYW1faWQsCisJ
CQkgICh1bnNpZ25lZCBsb25nIGxvbmcpIHhoY2lfdHJiX3ZpcnRfdG9fZG1hKAorCQkJCSAg
dXJiX3ByaXYtPnRkW2ldLnN0YXJ0X3NlZywKKwkJCQkgIHVyYl9wcml2LT50ZFtpXS5maXJz
dF90cmIpKTsKIAogCWZvciAoOyBpIDwgdXJiX3ByaXYtPm51bV90ZHM7IGkrKykgewogCQl0
ZCA9ICZ1cmJfcHJpdi0+dGRbaV07Ci0tIAoyLjI1LjEKCg==

--------------BhpMM4pGuBIqa30YlFTD00A0--

