Return-Path: <linux-usb+bounces-30539-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F66C615B3
	for <lists+linux-usb@lfdr.de>; Sun, 16 Nov 2025 14:28:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 305FE3AC0A7
	for <lists+linux-usb@lfdr.de>; Sun, 16 Nov 2025 13:28:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46BAB2F83DE;
	Sun, 16 Nov 2025 13:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wLc+3s6c"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10472E2F1F
	for <linux-usb@vger.kernel.org>; Sun, 16 Nov 2025 13:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763299690; cv=none; b=HG3fkgCXv0S05UMYAF+z/qp0cxaMhFBvLEjimXPwcbe0UGGxlQL9Nx9FB384iIloNuWQGH2uWX1WjFNclJK0wnxZR/hc23UP2P5KhMWGRTiX2yeY0H2IE7uAiN8AeKo+CnMXbb+7woJZuxmS+lytJVg8Ik1r+GIESlM+M2ZpRUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763299690; c=relaxed/simple;
	bh=ZQoKp1pMo4cAGytSctoAgqd4T0pcIg5MnXY+mHXsTfs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pm3KcBPzosm4m9s1RwLkuoh8giLjBr6bZEFZQlmgG14Ig1aWb13AS8GTa/InfTU0Ce8jJ1i5ix3ZbdC2gzdhrrcWrUklplDj2KK2/RW3HHc5BdQE9QssfXdZY93e763I6mchhWGjkWlLfKoYwuckUmGJp4VfBkUqHeVp4AJ4998=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=wLc+3s6c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9971EC116B1;
	Sun, 16 Nov 2025 13:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1763299687;
	bh=ZQoKp1pMo4cAGytSctoAgqd4T0pcIg5MnXY+mHXsTfs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wLc+3s6cyLrg/GUTnG4hvKwVlabsHVzXLqWzM3u6dQFRMKDo53WFhRSGNUbwu+AMn
	 sIVyCiuzYrnhNyYJukrPJI7PbJoGE3Eh+2GIs7YOR+ZMkqHeeVKnSZM534SQZHu4OH
	 IweOwp+7LLPPcZhOftbMbHvwTUjfFUODvxgL/pDQ=
Date: Sun, 16 Nov 2025 08:28:04 -0500
From: gregkh <gregkh@linuxfoundation.org>
To: =?utf-8?B?Zmx5bm5uY2hlbijpmYjlpKnmpZop?= <flynnnchen@tencent.com>
Cc: linux-usb <linux-usb@vger.kernel.org>
Subject: Re: Re: [PATCH] usb: storage: sddr55: Reject out-of-bound new_pba
Message-ID: <2025111615-counting-unsteady-7469@gregkh>
References: <B2DC73A3EE1E3A1D+202511161322001664687@tencent.com>
 <2025111605-stardust-unvocal-222f@gregkh>
 <EBC31800E75832ED+202511162115037260372@tencent.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <EBC31800E75832ED+202511162115037260372@tencent.com>

On Sun, Nov 16, 2025 at 09:15:05PM +0800, flynnnchen(陈天楚) wrote:
> On Sun, Nov 16, 2025 at 07:07:57AM -0500, gregkh wrote:
> 
> >On Sun, Nov 16, 2025 at 01:22:01PM +0800, flynnnchen(陈天楚) wrote:
> >> Discovered by Atuin - Automated Vulnerability Discovery Engine.
> >> 
> >> new_pba comes from the status packet returned after each write.
> >> A bogus device could report values beyond the block count derived
> >> from info->capacity, letting the driver walk off the end of
> >> pba_to_lba[] and corrupt heap memory.
> >> 
> >> Reject PBAs that exceed the computed block count and fail the
> >> transfer so we avoid touching out-of-range mapping entries.
> >> 
> >> Signed-off-by: Tianchu Chen <flynnnchen@tencent.com>
> >> ---
> >>  drivers/usb/storage/sddr55.c | 6 ++++++
> >>  1 file changed, 6 insertions(+)
> >> 
> >> diff --git a/drivers/usb/storage/sddr55.c b/drivers/usb/storage/sddr55.c
> >> index b323f0a36..9d813727e 100644
> >> --- a/drivers/usb/storage/sddr55.c
> >> +++ b/drivers/usb/storage/sddr55.c
> >> @@ -469,6 +469,12 @@ static int sddr55_write_data(struct us_data *us,
> >>  		new_pba = (status[3] + (status[4] << 8) + (status[5] << 16))
> >>  						  >> info->blockshift;
> >>  
> >> +		/* check if device-reported new_pba is out of range */
> >> +		if (new_pba >= (info->capacity >> (info->blockshift + info->pageshift))) {
> >> +			result = USB_STOR_TRANSPORT_FAILED;
> >> +			goto leave;
> >> +		}
> >
> >Any chance you tested this with real hardware?
> >
> >thanks,
> >
> >greg k-h
> 
> 
> Unfortunately, I do not own the real hardware, and have not tested it on a
> a real device.
> 
> Some of my thoughts on this patch, from static analysis:
> 
> Q: What if this code is called, before info->capacity is set?
> A: If sddr55_write_data is called before sddr55_get_capacity,
> info->capacity and pba_to_lba should both be 0, in the patched code it will
> always fail, while in the original code it will cause NULL-deref.

But how can that out-of-order calling happen?

> Q: Is checking new_pba here essential in all cases?
> A: Yes, in all the code path beneath it, new_pba is always used to index
> the array, with no exception.

Fair enough :)

> Q: What if device reports write success, and gives back an OOB new_pba?
> A: For the patched code, it will fail the write transfer. In the original
> one, it is very likely to fail as well, because:
> 
> 		/* check that new_pba wasn't already being used */
> 		if (info->pba_to_lba[new_pba] != UNUSED_BLOCK) {  <--- Very likely to fail here
> 			printk(KERN_ERR "sddr55 error: new PBA %04X already in use for LBA %04X\n",
> 				new_pba, info->pba_to_lba[new_pba]);
> 			info->fatal_error = 1;
> 			set_sense_info (3, 0x31, 0);
> 			result = USB_STOR_TRANSPORT_FAILED;
> 			goto leave;
> 		}
> 
> The original code OOB-reads info->pba_to_lba[new_pba], which is very
> unlikely to equal to UNUSED_BLOCK (i32 0x3ff) by chance, thus the original
> code will also fail the transfer in most cases.
> 
> From my understanding, the patched code solves the OOB issue, while being
> aligned with the original behavior in most cases I have imagined.

Ok, seems sane, I'll be glad to take this, just wanted to be sure.  I
kind of doubt anyone has this hardware anymore anyway :)

thanks,

greg k-h

