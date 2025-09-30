Return-Path: <linux-usb+bounces-28818-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A16E9BAD0BB
	for <lists+linux-usb@lfdr.de>; Tue, 30 Sep 2025 15:22:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C39567ABC1C
	for <lists+linux-usb@lfdr.de>; Tue, 30 Sep 2025 13:21:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5175303C9B;
	Tue, 30 Sep 2025 13:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="GLto13CZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C56C30146C
	for <linux-usb@vger.kernel.org>; Tue, 30 Sep 2025 13:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759238570; cv=none; b=Hc1VvuvddckWhVagwFSAC3wQqSz6dZQ7orp1702oqWsmnMNl3Q/4cmmYFrbIehmm4Qf2yKySneY3rzRWOntW4fIcLOQs1woy725SXQpoiyIwSgTsKiJPm2b0KcMdxdOkyPgmwDj+TRm/+bJMkTPnAk5mgcSZ/QXsYuLOXxf/h0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759238570; c=relaxed/simple;
	bh=59NoSC7ocZ7c3HpMjXdvCeJv9n5mEh9jzMeOC/NIuGs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VHb77ua9t+S/O2LjMVy0ju+RUnEyiuiLOeqHn4hsIbM+o8MSOgVtItev/vojD2qHUeAJLgr2aqcnw4Wt/BNxZQA9taJhvqk958JrhwzF1NszjSi16pNOxHle0cxM50LIs0nWWWfSM+nBySHEwk4nJQPudngIN21EjEIUw1kPfsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=GLto13CZ; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6366b7fd337so934403a12.0
        for <linux-usb@vger.kernel.org>; Tue, 30 Sep 2025 06:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1759238566; x=1759843366; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uwAebk43If0gjy3ve3r9IFpSG2OftYAndV3V+n10Lek=;
        b=GLto13CZ6JMPlbvF/OCZ1TS1hOu/R8r+b+/yz6gY66gKmBqG5gWKjN+dU/LD/dUd2k
         iD3D4dM7F/qWwyae1v5YMx02CWMds4vqkX2NPQMLL3baHcFwVs3kQ306pfFkgWehdEUY
         Yu+8IE6nDs/DDBI8jgwI2UY9aIVSQp7+Slh/sXtLFuU+G5g/ZMU1PiV220vNnXR2IGSH
         OHBYi0XP6TbxPyLCtGoPvAgfIhBjYaSMGu+2b1n+YeFePcbP/FhtWnBiUo8FiVhZJTuT
         drkHDHAn9/e8XXNhTEkEbel0vnAdiKOtnk3Ic/Kim9zKjQV2WwUAg1dHPJrO2AKugJ96
         Rf5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759238566; x=1759843366;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uwAebk43If0gjy3ve3r9IFpSG2OftYAndV3V+n10Lek=;
        b=OyXSwD0U0qVscFYOiWp0MqCjjW+EnnNOiDayWPuI1/na3Rj3bZQ6gMNwo5cVF1H3Db
         MBaCqd6TT0fZs+MSUBQJIYgrU0O4s0iYo1I+AeP9r1eHTFpge/cT/tdGQtzKP5HPIOiT
         7c+00+J1Kh32X1UQkRecsJPXJU6qNFaqe7oH9A97MxBeDKAGK2/2pJNogfrbUuceF9LD
         p4KtZxnl0Vj6nbiw3PLUtRBjOeaHhEcKpB7ai//eC/nY4Yj0LctOgt/rWESEmeL7+1Pv
         /zlPAbc42XJEqAqrE1viC2Fqp5U1jyN/V8lLJK1F44GqdAdUJeZESk3DbK+ycra3olBN
         9EQg==
X-Gm-Message-State: AOJu0Yxlm4cRcspcSYtDhKvkrJJaaI0jLYMrlKs8cxhmx3/5nVad6YHc
	fFLn7q/gzn9BEPDSRRu/3WU0ma9GIf5xoBg0tY9U0bZ6yydmbqcA/n8KuLfKC4ImcVD85rnGdLE
	rSwIWZqk=
X-Gm-Gg: ASbGncs8dcBIOsYsfz+hVhaHggvPEPnP+5sZuDNJWNNBLlo4k3nJPEZfrEY1fSyPOuw
	WBr9iKI9ofBe0TuReUizjmD69wIMOtI/U9uTNA7OuPTdgLxxs6TSy10IYxBae2wILWwDpdEV1Fs
	qGjhv9HwQX6/metG+fgt6rJVbLD8SrSWk8o+1PPhCuw+B/ZESAP5IWLPhKvRt8kO5XyAcaOEbZ2
	3QH4I8Fy82mMo31XTvpHYaSWqREjD/T0axgqBMe31P8ju6FrK/r4FmJO2/nIMlDXYvSxaexWMTX
	v+Evc6TZu4yujkwapmA/EFaiDhdl9zFjuPHyMi6KCyp2HUD6i7CLDYJOMDfTBAD4F6BLLpLgsMk
	uugIa9AAcwsHJcI19xixNOo4p5wVIV1vV720dKl94iTDsV9thneUTm8CKlORe+cHyrht7SG51wW
	nbV3S3o1+Llwqj1GRyZYMViX8=
X-Google-Smtp-Source: AGHT+IGMmebQvklxeUJZNswwjRqyuzOfwdDvXkiArUTNHu/zyJ1G1AIYldRx7ek+Ug5wpdnFDX7cug==
X-Received: by 2002:a17:906:c150:b0:b04:6fc9:f108 with SMTP id a640c23a62f3a-b34b86a19b0mr2094007966b.24.1759238566474;
        Tue, 30 Sep 2025 06:22:46 -0700 (PDT)
Received: from ?IPV6:2001:a61:13a9:ac01:423a:d8a6:b2d:25a7? ([2001:a61:13a9:ac01:423a:d8a6:b2d:25a7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3b0c9c9e8esm686349166b.59.2025.09.30.06.22.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Sep 2025 06:22:46 -0700 (PDT)
Message-ID: <6c65094e-81e5-4ce8-8592-9458c51116f7@suse.com>
Date: Tue, 30 Sep 2025 15:22:45 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fix urb unmapping issue when the uas device is remove
 during ongoing data transfer
To: guhuinan <guhuinan@xiaomi.com>, Alan Stern <stern@rowland.harvard.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-scsi@vger.kernel.org,
 usb-storage@lists.one-eyed-alien.net, linux-kernel@vger.kernel.org,
 Yu Chen <chenyu45@xiaomi.com>
References: <20250930045309.21588-1-guhuinan@xiaomi.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20250930045309.21588-1-guhuinan@xiaomi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 30.09.25 06:53, guhuinan wrote:
> From: Owen Gu <guhuinan@xiaomi.com>
> 
> When a UAS device is unplugged during data transfer, there is
> a probability of a system panic occurring. The root cause is
> an access to an invalid memory address during URB callback handling.
> Specifically, this happens when the dma_direct_unmap_sg() function
> is called within the usb_hcd_unmap_urb_for_dma() interface, but the
> sg->dma_address field is 0 and the sg data structure has already been
> freed.
> 
> The SCSI driver sends transfer commands by invoking uas_queuecommand_lck()
> in uas.c, using the uas_submit_urbs() function to submit requests to USB.
> Within the uas_submit_urbs() implementation, three URBs (sense_urb,
> data_urb, and cmd_urb) are sequentially submitted. Device removal may
> occur at any point during uas_submit_urbs execution, which may result
> in URB submission failure. However, some URBs might have been successfully
> submitted before the failure, and uas_submit_urbs will return the -ENODEV
> error code in this case. The current error handling directly calls
> scsi_done(). In the SCSI driver, this eventually triggers scsi_complete()
> to invoke scsi_end_request() for releasing the sgtable. The successfully
> submitted URBs, when being completed (giveback), call
> usb_hcd_unmap_urb_for_dma() in hcd.c, leading to exceptions during sg
> unmapping operations since the sg data structure has already been freed.
> 
> This patch modifies the error condition check in the uas_submit_urbs()
> function. When a UAS device is removed but one or more URBs have already
> been successfully submitted to USB, it avoids immediately invoking
> scsi_done(). Instead, it waits for the successfully submitted URBs to
> complete , and then triggers the scsi_done() function call within
> uas_try_complete() after all pending URB operations are finalized.
> 
> Signed-off-by: Yu Chen <chenyu45@xiaomi.com>
> Signed-off-by: Owen Gu <guhuinan@xiaomi.com>
> ---
>   drivers/usb/storage/uas.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/storage/uas.c b/drivers/usb/storage/uas.c
> index 4ed0dc19afe0..6bfc7281f7ad 100644
> --- a/drivers/usb/storage/uas.c
> +++ b/drivers/usb/storage/uas.c
> @@ -699,7 +699,9 @@ static int uas_queuecommand_lck(struct scsi_cmnd *cmnd)
>   	 */
>   	if (err == -ENODEV) {
>   		set_host_byte(cmnd, DID_NO_CONNECT);

Why then set the host byte unconditionally?

> -		scsi_done(cmnd);
> +		if (!(cmdinfo->state & (COMMAND_INFLIGHT | DATA_IN_URB_INFLIGHT |
> +				DATA_OUT_URB_INFLIGHT)))
> +			scsi_done(cmnd);

It would seem to me that in this case you need to make sure
in the completion handlers that scsi_done() is always called,
even if the resetting flag is set.

	Regards
		Oliver


