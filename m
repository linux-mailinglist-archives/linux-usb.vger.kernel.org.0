Return-Path: <linux-usb+bounces-16868-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0A99B6D42
	for <lists+linux-usb@lfdr.de>; Wed, 30 Oct 2024 21:06:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 58A402820E2
	for <lists+linux-usb@lfdr.de>; Wed, 30 Oct 2024 20:06:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C39F51D130B;
	Wed, 30 Oct 2024 20:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Orrkp90W"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573231D07A2
	for <linux-usb@vger.kernel.org>; Wed, 30 Oct 2024 20:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730318780; cv=none; b=B5fdft2Si4793oLC+Nd+QjVETi7fz2mxO/N/Gn4J/UUbcA28YN7DbOZAiBuZ3o4cVAsSANkr/qFG2WEJCdIBTK6mzeR0xd6CpKdaNSsvX7tfQJko9sf9ew3uvNIPcecbQalIiX8uP7HIaFEDoeNa++YhpyWSHRIG1vd68su2WSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730318780; c=relaxed/simple;
	bh=kctufgAvq783q4X+XLizbdXrDx4/qZSTJ/Pleh1AiaQ=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mXzyfoUdaV4p/O1UGZlDf4HrDzsqw80ODKmdKHDs3ELWXV61JQokuYHIi7ANcNpWXs4hBNJ9rAoyPgP+NsmKhiP83tVzKnLd9Zll08ibmRlsykg9pRuoYWoUGi8YmlHQYswkipr9SMgVMBBNqCpl1IuEPk2hVWIwvP1PU20+Aco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Orrkp90W; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7181a8af549so86049a34.2
        for <linux-usb@vger.kernel.org>; Wed, 30 Oct 2024 13:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730318777; x=1730923577; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FIEo5i62t5pO/mwkzEKuH5eq1W9T1lB+v4M+nJyzxtg=;
        b=Orrkp90WD1XjU6rF4sbVEWnYa2XTXwRPPnsvkrn+F3rnh60l7lXSjMa7v+9Lmp0fq6
         TKIS891GGOY2wyX6Ae3gbHM7xRYL3HczgyDanOKFSsfnivgdwQ08TUUo7gPpOjyef+kh
         j2V+KjfFsoahCGcwKIkwzP9NEFQVJGcq0C92CfT9Mx2VGeRmmv3AdCYZC0P38tPnLV7P
         WZX/e92mhpt4zD7uMZLROz2efxx81VFNvz/DfynAfwF2Rbr1lOqGtf/hXymm4nQhW/+O
         dmEIkpXYr/YV6fH0lSiLq/+l4KknoRs4K6TaG9r1nqmyQI+WbDEXCy99XhDhiNtMofkl
         3I7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730318777; x=1730923577;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FIEo5i62t5pO/mwkzEKuH5eq1W9T1lB+v4M+nJyzxtg=;
        b=l5YXVIliaSwIIRptFjhi8w+yidwMal3QxmsUoNFftvdNAd7emDO2/xu1fBElwASr6Z
         xG+txzDCY+oFArzliZao3a7BBR2+2nkYSxF80DKIKDKWu1Yu6ng+VclaXAc6XfeqS0c/
         VL7cv5urUw2Wu47lf6MzxdSMlbAc2sZippMhsuZhMfmaJIJLjee4J3FZrEBJb/H5SFs2
         BjBfYhBpEz0ep4vUnd132JM4k2st/cHFkZQxX/JA373gviFEXk5b3NlMp4ms8yqkLmvw
         UcCj3R6/3lkfHXInCNl1UQDJRr+dvUfjv/ntbzltninWmkiSyzmypzkcVuYtUdQp5Cf6
         hz+w==
X-Forwarded-Encrypted: i=1; AJvYcCWp/Tf+Jr10zv4DgkaSx7WqB2Zq0mPoV3uS8VM/MgwvfZkgbgitgMqMEzJyYXIUypcwXJ22lDXuT1s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQozre1J09E37kQZhtTN9sY/3VxVhplCsgEfiQBT1PM/zBrfTW
	2VSDFabrMHbMI7Yvv9Xx5SKFbOgYK5aVd/3u1v33MSaLSQTFj50I
X-Google-Smtp-Source: AGHT+IF06zwKCHTF7t+BIitU0bIOH21gfUn8ZpoTjMWE2dnsoHKWGRHs4KeLVTngRAvt5HlI9ckanA==
X-Received: by 2002:a05:6830:6009:b0:718:187f:80d8 with SMTP id 46e09a7af769-71868295a3cmr20154175a34.27.1730318777318;
        Wed, 30 Oct 2024 13:06:17 -0700 (PDT)
Received: from neuromancer. ([2600:1700:fb0:1bcf::54])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7189cc5727esm14402a34.3.2024.10.30.13.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 13:06:17 -0700 (PDT)
Message-ID: <672291b9.9d0a0220.1f040e.013f@mx.google.com>
X-Google-Original-Message-ID: <ZyKRt62nhP--31Ah@neuromancer.>
Date: Wed, 30 Oct 2024 15:06:15 -0500
From: Chris Morgan <macroalpha82@gmail.com>
To: Roger Quadros <rogerq@kernel.org>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 2/2] usb: dwc3: core: Prevent phy suspend during init
References: <cover.1713310411.git.Thinh.Nguyen@synopsys.com>
 <e8f04e642889b4c865aaf06762cde9386e0ff830.1713310411.git.Thinh.Nguyen@synopsys.com>
 <1519dbe7-73b6-4afc-bfe3-23f4f75d772f@kernel.org>
 <671bef75.050a0220.e4bcd.1821@mx.google.com>
 <20241025224003.yfujqurxhrgzgzld@synopsys.com>
 <CADcbR4KhWdXpynk2c-tryx1=Eg4LhC4t=C6zcVHAMcMz2hH-8Q@mail.gmail.com>
 <20241029224900.by3zglncf33izsgw@synopsys.com>
 <ca4daad3-9a34-4331-9faa-91b960924b9e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ca4daad3-9a34-4331-9faa-91b960924b9e@kernel.org>

On Wed, Oct 30, 2024 at 03:10:34PM +0200, Roger Quadros wrote:
> Hi Chris,
> 
> On 30/10/2024 00:49, Thinh Nguyen wrote:
> > Hi,
> > 
> > On Tue, Oct 29, 2024, Chris Morgan wrote:
> >> Sorry, to be specific it was the fix that causes the issues I'm now
> >> observing. When I explicitly revert commit
> >> 705e3ce37bccdf2ed6f848356ff355f480d51a91 things start working again
> >> for me. With that commit in place, however, suspend fails for me.
> > 
> > Ok, Roger's patch is causing issue on your platform and the $subject
> > patch? Can you provide more details on your test sequence?
> > 
> > * What does "no longer able to suspend" mean exactly (what error?)
> > * What mode is your usb controller?
> > * Is there any device connected while going into suspend?
> > * Can you provide dwc3 regdump?
> 
> Commit 705e3ce37bccdf2ed6f848356ff355f480d51a91 will enable
> DWC3_GUSB2PHYCFG_SUSPHY in DWC3_GUSB2PHYCFG(i)
> and DWC3_GUSB3PIPECTL_SUSPHY in DWC3_GUSB3PIPECTL(i) during
> system suspend path, unless snps,dis_u2_susphy_quirk or
> snps,dis_u3_susphy_quirk is set.
> 
> I see rK356x.dtsi has snps,dis_u2_susphy_quirk;
> Does adding snps,dis_u3_susphy_quirk resolve the issue?

I'm afraid it does not fix the issue. Specifically when I do
"systemctl suspend" the device begins to suspend but freezes with the
kernel log output via serial console listed previously. Note I have
console enabled in suspend. Additionally button input no longer
works at this point.

Specifically, I'm testing this with the Anbernic RG353P device based on
the Rockchip RK3566 SoC, in case you're curious.

I'm not able to get you a register dump post suspend attempt as the
system completely freezes, however I can get you a dump prior to
suspend if that will help?

Thank you,
Chris

> 
> cheers,
> -roger
> > 
> > Thanks,
> > Thinh
> > 
> >>
> >> On Fri, Oct 25, 2024 at 5:40 PM Thinh Nguyen <Thinh.Nguyen@synopsys.com> wrote:
> >>>
> >>> Hi,
> >>>
> >>> On Fri, Oct 25, 2024, Chris Morgan wrote:
> >>>>
> >>>> This patch seems to break system suspend on at least the Rockchip
> >>>> RK3566 platform. I noticed that I was no longer able to suspend
> >>>> and git bisect led me to this patch.
> >>>>
> >>>> My kernel message log shows the following, at which point it freezes
> >>>> and does not allow me to resume from suspend:
> >>>>
> >>>> [   27.235049] PM: suspend entry (deep)
> >>>> [   27.871641] Filesystems sync: 0.636 seconds
> >>>> [   27.885320] Freezing user space processes
> >>>> [   27.886932] Freezing user space processes completed (elapsed 0.001 seconds)
> >>>> [   27.887642] OOM killer disabled.
> >>>> [   27.887981] Freezing remaining freezable tasks
> >>>> [   27.889655] Freezing remaining freezable tasks completed (elapsed 0.001 seconds)
> >>>>
> >>>> Thank you,
> >>>> Chris
> >>>
> >>> Did you try out Roger's fix?
> >>> 705e3ce37bcc ("usb: dwc3: core: Fix system suspend on TI AM62 platforms")
> >>>
> >>> https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=705e3ce37bccdf2ed6f848356ff355f480d51a91__;!!A4F2R9G_pg!ZXQdR2uLykSD67_3JSm0RZHuyJ7IVnw5EvmYvLnPsf3dDEilv5ZgHD9GX7gZr52t0H7oFKifzAEhbdK8EGYzmSji2UI$ 
> >>>
> >>> BR,
> >>> Thinh
> 

