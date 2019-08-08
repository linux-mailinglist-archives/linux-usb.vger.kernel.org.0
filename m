Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DBB785D61
	for <lists+linux-usb@lfdr.de>; Thu,  8 Aug 2019 10:52:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731364AbfHHIw4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Aug 2019 04:52:56 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.23]:16878 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725817AbfHHIw4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Aug 2019 04:52:56 -0400
X-Greylist: delayed 363 seconds by postgrey-1.27 at vger.kernel.org; Thu, 08 Aug 2019 04:52:54 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1565254374;
        s=strato-dkim-0002; d=hashmail.org;
        h=Message-ID:Subject:Cc:To:From:Date:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=2zgjnksGmQ/ZAqwgmVBQpCI5NujcSeTtpImhQoYcKR0=;
        b=dLNM7VVf6xk1bS7UKiMaIlYdpR2Fhaq6lZhD+Vq/2HA9qe8zYEb0Z+lPrnVqovL2d2
        tKkxlVRcFySQolv6qvwMfvB2it/M5D05vbRDaJi3gnkNI1JKMnrtQt0qcuKOlyFf86iW
        dzMDA7Eb0ChkUtQkfCdt/1f12OpDbOKeTnbro8jropClwn3u8kE9AnrfAso+QlzaxEqn
        2zpIa+6D05ePSsLBFWppUulGgPRsQinXAirPRhwxBYaryb3yPTr6CLPiDtGVPfL2C3k6
        VhRBcTKCORku1co2r1wpoyxerFQoOPavEQhF0R1+PKHsmeojEJK2LuOdfzrDxIF6Uebp
        HCfQ==
X-RZG-AUTH: ":O2kGeEG7b/pS1F+/SC3i33Z09cEcHcRBAtqtGgRBDGeSaUqOsX4glAsBpQEeWZN4DOM7"
X-RZG-CLASS-ID: mo00
Received: from localhost
        by smtp.strato.de (RZmta 44.24 DYNA|AUTH)
        with ESMTPSA id f0aa24v788kcir9
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Thu, 8 Aug 2019 10:46:38 +0200 (CEST)
Date:   Thu, 8 Aug 2019 10:46:36 +0200
From:   yvahkhfo.1df7f8c2@hashmail.org
To:     linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     security@kernel.org
Subject: usb zero copy dma handling
Message-ID: <20190808084636.GB15080@priv-mua.localdomain>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="ZPt4rx8FFjLCG7dd"
Content-Disposition: inline
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--ZPt4rx8FFjLCG7dd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello linux-usb and linux-arm.

Ccing security@ because "the kernel dma code is mapping randomish
kernel/user mem to a user process" seems to have security implications
even though i didnt research that aspect past "its a 100% reliable way
to crash a raspi from userspace". 

tried submitting this through linux-arm-kernel ~2 weeks ago but
the only "response" i got was phishing-spam.
tried to follow up through raspi-internals chat, they suggested
i try linux-usb instead, but otoh the original reporter was
deflected from -usb to "try some other mls, they might care".
https://www.spinics.net/lists/linux-usb/msg173277.html

if i am not following some arcane ritual or indenting convention required 
by regular users of these lists i apologize in advance, but i am not a 
kernel developer, i am just here as a user with a bug and a patch. 
(and the vger FAQ link 404s...) 

i rediffed against HEAD even though the two weeks old patch still applied
cleanly with +2 offset.

# stepping off soap box # actual technical content starts here #

this is a followup to that thread from 2018-11:
https://www.spinics.net/lists/arm-kernel/msg685598.html

the issue was discussed in more detail than i can claim
to fully understand back then, but no fix ever merged.
but i would really like to use rtl_433 on a raspi without
having to build a custom-patched kernel first.

the attached patch is my stripdown/cleanup of a devel-diff
provided to me by the original reporter Steve Markgraf.
credits to him for the good parts, blame to me for the bad parts.

this does not cover the additional case of "PIO-based usb controllers"
mainly because i dont understand what that means (or how to handle it)
and if its broken right now (as the thread indicates) it might
as well stay broken until someone who understands cares enough.

could you please get this on track for merging?

regards,
  x23




--ZPt4rx8FFjLCG7dd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="arm-usb-dma-v2.diff"

diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
index b265ab5405f9..69594c2169ea 100644
--- a/drivers/usb/core/devio.c
+++ b/drivers/usb/core/devio.c
@@ -238,9 +238,14 @@ static int usbdev_mmap(struct file *file, struct vm_area_struct *vma)
 	usbm->vma_use_count = 1;
 	INIT_LIST_HEAD(&usbm->memlist);
 
+#ifdef CONFIG_X86
 	if (remap_pfn_range(vma, vma->vm_start,
 			virt_to_phys(usbm->mem) >> PAGE_SHIFT,
 			size, vma->vm_page_prot) < 0) {
+#else /* !CONFIG_X86 */
+	if (dma_mmap_coherent(ps->dev->bus->sysdev, 
+			vma, mem, dma_handle, size) < 0) {
+#endif /* !CONFIG_X86 */
 		dec_usb_memory_use_count(usbm, &usbm->vma_use_count);
 		return -EAGAIN;
 	}

--ZPt4rx8FFjLCG7dd--
