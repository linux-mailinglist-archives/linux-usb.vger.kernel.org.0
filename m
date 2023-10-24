Return-Path: <linux-usb+bounces-2130-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 076647D5643
	for <lists+linux-usb@lfdr.de>; Tue, 24 Oct 2023 17:27:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 911C6B210B3
	for <lists+linux-usb@lfdr.de>; Tue, 24 Oct 2023 15:27:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BC1137169;
	Tue, 24 Oct 2023 15:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0137D37144
	for <linux-usb@vger.kernel.org>; Tue, 24 Oct 2023 15:27:41 +0000 (UTC)
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id B1A0990
	for <linux-usb@vger.kernel.org>; Tue, 24 Oct 2023 08:27:38 -0700 (PDT)
Received: (qmail 460881 invoked by uid 1000); 24 Oct 2023 11:27:38 -0400
Date: Tue, 24 Oct 2023 11:27:38 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Harald Dunkel <harri@afaics.de>
Cc: linux-usb@vger.kernel.org
Subject: Re: JMS583Gen2 USB PCIe adapter with trim support?
Message-ID: <83dd2d4b-57c7-4935-8c08-9091249cb2f9@rowland.harvard.edu>
References: <cf258eb0-58c5-4661-bf2a-7366fb0aa3b9@afaics.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cf258eb0-58c5-4661-bf2a-7366fb0aa3b9@afaics.de>

On Tue, Oct 24, 2023 at 09:59:27AM +0200, Harald Dunkel wrote:
> Hi folks,
> 
> according to https://www.jmicron.com/file/download/1002/JMS583_Product+Brief.pdf
> my USB-C M.2 adapter "JMicron USA Technology Corp. JMS583Gen 2 to PCIe Gen3x2 Bridge"
> is supposed to support trim, but sg_vpd reports

Note: sg_vpd is a SCSI-reporting program, not a USB-reporting program, 
and you are asking it to report the contents of the block page.

> {root@cecil:data10 () 506} sg_vpd -p bl /dev/sdd
> Block limits VPD page (SBC):
>   Write same non-zero (WSNZ): 0
>   Maximum compare and write length: 0 blocks [Command not implemented]
>   Optimal transfer length granularity: 8 blocks
>   Maximum transfer length: 65535 blocks
>   Optimal transfer length: 65535 blocks
>   Maximum prefetch transfer length: 65535 blocks
>   Maximum unmap LBA count: -1 [unbounded]
>   Maximum unmap block descriptor count: 63
>   Optimal unmap granularity: 0 blocks [not reported]
>   Unmap granularity alignment valid: false
>   Unmap granularity alignment: 0 [invalid]
>   Maximum write same length: 0 blocks [not reported]
>   Maximum atomic transfer length: 0 blocks [not reported]
>   Atomic alignment: 0 [unaligned atomic writes permitted]
>   Atomic transfer length granularity: 0 [no granularity requirement
>   Maximum atomic transfer length with atomic boundary: 0 blocks [not reported]
>   Maximum atomic boundary size: 0 blocks [can only write atomic 1 block]
> 
> {root@cecil:data10 () 507} sg_vpd -p lbpv /dev/sdd
> Logical block provisioning VPD page (SBC):
>   Unmap command supported (LBPU): 1
>   Write same (16) with unmap bit supported (LBPWS): 0
>   Write same (10) with unmap bit supported (LBPWS10): 0
>   Logical block provisioning read zeros (LBPRZ): 0
>   Anchored LBAs supported (ANC_SUP): 0
>   Threshold exponent: 0 [threshold sets not supported]
>   Descriptor present (DP): 0
>   Minimum percentage: 0 [not reported]
>   Provisioning type: 0 (not known or fully provisioned)
>   Threshold percentage: 0 [percentages not supported]
> 
> {root@cecil:data10 () 508} lsusb
> Bus 002 Device 004: ID 152d:0583 JMicron Technology Corp. / JMicron USA Technology Corp. JMS583Gen 2 to PCIe Gen3x2 Bridge
> :
> 
> 
> You can surely better estimate than me whether these values sound
> reasonable. Do they? I hesitate to set provisioning_mode to unmap.
> 
> Device is an ICY BOX M.2 SSD/NVMe adaptor IB-1807MT-C31.

Given that virtually all the information you have provided refers to the 
SCSI or block device interface rather than the USB device interface, it 
seems you would be a lot better off posting this question to a SCSI- or 
block-related mailing list.

About all I can say with regard to your question is that the bridge 
probably supports trim commands if the drive connected to it does.

Alan Stern

