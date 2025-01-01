Return-Path: <linux-usb+bounces-18939-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8609FF476
	for <lists+linux-usb@lfdr.de>; Wed,  1 Jan 2025 17:05:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA4E83A2681
	for <lists+linux-usb@lfdr.de>; Wed,  1 Jan 2025 16:04:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5663D1E1C37;
	Wed,  1 Jan 2025 16:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Q6v6CJKT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CED10940
	for <linux-usb@vger.kernel.org>; Wed,  1 Jan 2025 16:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735747494; cv=none; b=tsN/7mpBhzxgJ1LapBXqmyCJAcy9N15pIsToG/wVabpq7u9OOROfOwknnkiSyzVSPFVa7JoSurwTYDR8vK1kVd0zHUHP3S9cMHTN6eJa3wmMUc/iXV3WAQeXKUQqKAmScxx6+iOLEf3X7ZsCEaj9paEEbe51IG2fjQZ1byzmcho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735747494; c=relaxed/simple;
	bh=UYbICLI4osPhg5GV4XHf5nnecpK/6FttC/DswBunUzA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aejQ9Aez6ODryB9OdMk3CyjGmUGjPL4xA+2SqZpcmfTK0NqThJUHWxKAI3ZMumz+o/pbRXMgKQJYtQn5cglykOOWCc2ElwAaH+4KstEzzC4r6AEyPdmvlSdZdHLDSO2JpBP0BNP3L/4lWrdgK2YVvtJ9yxZlwHj9VPr/qH2QPU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Q6v6CJKT; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7b8618be68bso832477085a.3
        for <linux-usb@vger.kernel.org>; Wed, 01 Jan 2025 08:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1735747492; x=1736352292; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fyfYaOi3lEoeliRyqhUDjnZeaZNoVIjCm9hC4zGYUpY=;
        b=Q6v6CJKTPd0GnDmfdosS/jtyDU1KullMWUHgkTeDYYbGpW57NhOeHeu3FnwJw3uz/E
         cSsx/GKF3kFH0HYiMoux9UhcIQZ8bCZu/nvZPEHzJngZaiVzQ757OC7IltE1H8QztNxF
         wnodCViPo/gq14H3ZQigRD+OpNnAvlWoJNyBr6+RScJiHbVxBQ32SIYNMr5m4B4IpLBU
         Y5qzZcUt6WcrbHIh3wlWwcIrMOc29qxogyPZHlBZ3nnve2yVnYsBQP0JIt+ykkU+g7/1
         Skd93LuxgboVjiNdbTpvCUmzjAGR+cFubltKWXcdrsadjEexN9cSGhK6EXt725iHrnCx
         0A1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735747492; x=1736352292;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fyfYaOi3lEoeliRyqhUDjnZeaZNoVIjCm9hC4zGYUpY=;
        b=C3s+Jzex9KMqGj/Jv/sWC2BnqJ26SvRjMtyCjrM1KDwKfJAPJGNHZVqiraLcvG5hDv
         zFhism/oWJ0rroYgtPYCNqIyOyhIZYeBAXQqUVgmK4Bkblo9G6SsF6N4vKDlHobSyxje
         nUofhzZnXKkvkkT8Q6iD8R/irVz8CqFfnM7tjKtNCs0QDdqYctDhY4DMZXbMiySteK8p
         cQPc9DwF1yJFbTGzzIlPqNY5i1U2tgYhLV9VENeyqdXXKco7dUb/KFTlhbkc1ccOexRH
         fRx5DRzWsqO5DeJ9pbHkHy0nFwQ9GkL8ZpCG5XYEh8LtOIQIskcG17AVsp3lC0hgiulm
         fjVA==
X-Gm-Message-State: AOJu0YzE5VvVAQJ9Lhh/tCrOiiOTIqq4TLMuucMAWptpDcANs4Up2CmI
	R6nVhhoaSQ3h28VGB2EuxjqGB158saT7Ib8ob+8G8jA6JxNWbZDHop2r3ZC2x+1XJP+18u+F7Rw
	=
X-Gm-Gg: ASbGnctTY+zqnNM83lcTUmEjJqHwZbKOuLD8SOxVZdHXNvdyLlr+xzGMhKXYBOcwvpE
	XEjlSMz6k1foAuuspMIGwgytnzXC1ZEOh+aiO/Tk5ARPt6zc/H7TBFNGnLXrsLkF53314diGFOv
	phTkre4EbyWbtdWjXEMuIPaVPU7w/2y5FDriwQJk+kh28TVRrAJ424aveZb+WvN0brwv2RmnNfs
	AKBsSRoYaiNwBtXlcSkWSyTMy1o+0FJRKycgfGHZha7t4L21r0ZbQZ9yw==
X-Google-Smtp-Source: AGHT+IGHKHKnAsagZPXjxQWjlrBaPvzDOROZkm4Prvb5+yg4CvXbN5c+2VhxTh+wvmQa8p2do5yEhw==
X-Received: by 2002:a05:6214:c6b:b0:6d8:af66:6344 with SMTP id 6a1803df08f44-6dd2330afbcmr754362956d6.2.1735747491702;
        Wed, 01 Jan 2025 08:04:51 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::5653])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dd181d3d90sm122182066d6.106.2025.01.01.08.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jan 2025 08:04:50 -0800 (PST)
Date: Wed, 1 Jan 2025 11:04:47 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: "Kris Karas (Bug Reporting)" <bugs-a21@moonlit-rail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [Regression] 3TB USB storage shows as 2TB under kernel 6.12
Message-ID: <bf1c26e8-9e61-42be-8404-1064d6fd1fab@rowland.harvard.edu>
References: <889a576d-60d5-4602-8b10-f11af5bc2107@moonlit-rail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <889a576d-60d5-4602-8b10-f11af5bc2107@moonlit-rail.com>

On Tue, Dec 31, 2024 at 10:36:06PM -0500, Kris Karas (Bug Reporting) wrote:
> Greetings, happy new year,
> 
> I have a 3TB (2.7 TiB) drive attached via an Initio USB-to-SATA bridge to a
> server that has been running mainline kernel 6.6.  As the next LTS kernel is
> now out, 6.12, I upgraded; here's how it went:
> 
> *  Booting into 6.6, drive shows normally as 3TB.
> *  Rebooting into 6.12, drive now shows as 2TB.
> *  Rebooting back into 6.6, drive continues to show as 2TB.
> *  Yank USB cable and re-plug, drive once again shows as 3TB.
> 
> As the errant drive size = 512 byte sectors * 2^32, it appears as though the
> USB-to-SATA initialization code in the more recent kernel is putting the
> adapter into some sort of 32-bit mode.  Resetting it via a disconnected
> cable (or power cycling) is required to get the normal behavior back.
> 
> The USB-to-SATA adapter lists itself (lsusb) as:
>     ID 13fd:1e40 Initio Corporation INIC-1610P SATA bridge
> It comes bundled inside a "Vantec NexStar CX" external drive enclosure.
> 
> There are no error messages in the dmesg output as the kernel boots. The
> output is the same between 6.6 and 6.12, except for the capacity reported,
> and the failure to properly read the GPT partition table under the truncated
> disk size.
> 
> Anybody have any suggestions for something to try?  An hdparm setting
> perhaps?  I could always bisect, but that would take awhile as the kernel
> versions are considerably distant.

Somebody on the linux-scsi list might be able to offer more pointed 
advice, as the SCSI stack is responsible for determining the size of an 
attached USB drive.

At the USB level, you can try collecting usbmon traces under both 6.6 
and 6.12 kernels, for purposes of comparison.  Follow the instructions 
in the kernel source file Documentation/usb/usbmon.rst, and be sure to 
start the trace before plugging in the drive.

Alan Stern

