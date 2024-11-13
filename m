Return-Path: <linux-usb+bounces-17560-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA0D9C7C27
	for <lists+linux-usb@lfdr.de>; Wed, 13 Nov 2024 20:30:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B781285C97
	for <lists+linux-usb@lfdr.de>; Wed, 13 Nov 2024 19:30:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7A2320402F;
	Wed, 13 Nov 2024 19:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e3yLX4aq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0154520125C
	for <linux-usb@vger.kernel.org>; Wed, 13 Nov 2024 19:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731526228; cv=none; b=DZuxxMKIr3IQF9sE7QhzE0rdmZ2No7LDlHcQ2mtAW/i0l2I45HuxFQ5jq0YDXTGoUXMxlnd7JHJXysuJZx3zu3NjhwWndJey0mSwIXEGafdpLFU4YdkfXX46CuxwPtaZtqIBJcykGXCFTMT4xmA7i+QWCKvLFJlzj0YyzV2ggeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731526228; c=relaxed/simple;
	bh=qkCRuimOgmc4A1+0KUQrhlV0TUWNklfsykibKuy7B2g=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RghmMxg8bZzc9rySR0+VCdgrK2iYcTWmlwrVoPYLktLqiNbknM4uYtjZ7n68kZshy5M3G/4uabK/V75Unn0C37mn5/Qcku4sAmfG4MqIKmvC03nAF9BUzfo7SSxI64Z7/fZSIxRBcx10z7q4Cli0PMltqjEyrlJEtLCmN/g0GO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e3yLX4aq; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-28854674160so3164874fac.2
        for <linux-usb@vger.kernel.org>; Wed, 13 Nov 2024 11:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731526225; x=1732131025; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7k3r5bO1IoTbDG8X6tb/bNSL7mthAvek8DLhuuoSSCg=;
        b=e3yLX4aqrKKlkMPR+s1UYH4R6cpGxceCFGdIUN2cqvYTUCCBjx11p3zR6gAc+dA+LI
         iMT+lqhFUfgt9x5cPQoSQxK2BZYyz3WsYPtpGzq/T+zUI3y23TXCR0vlWrOz0EKImZ/9
         Nk6kfb6tnxbwJ2QMBfBkCnfpHfFF8kO00eXhjrrx5jb1Fy/25B0MKhoft0yFH246CQvk
         AlU0qac+qDhxAmRjuT4ZAhP4qAhjM0jGzuF9nN05a9/ysKECQHmVhg8TzSPFbPaaVTTP
         wX5XfAm67GdGBoY8tT8GOj0y+RS56sdJaxgbUe2uFfLxoK+wFohnx1H7gnmkPFsvchO8
         /3GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731526225; x=1732131025;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7k3r5bO1IoTbDG8X6tb/bNSL7mthAvek8DLhuuoSSCg=;
        b=PjXPTmouDOdzcSvBQQuHAASJ+zqB4v/yU02NxbZLIkKO4uq8ENQLokZEtjM+rJK7BT
         Ag9YYLZ/Tn03re1oqot+2FYysDrPFbVWZ/khRYiKR3bv4eqSM70cWbd15UsY1twnKeUQ
         uxpxtP80R4xLwrJYX+1FFEvgHZ87CVGRgr1GtwPhIY9eK8Gb65Ro0GPMsUQLFUL2VtYw
         iCZokpq1bvGFZ1ka1vMMtpPo+7eAFz+PRuJ+HCUZJkOuaoSw/8KuMKqCGpLAGV6Eauum
         pMdD6UUMjBZ139iYrwE25yd74omYtWbCuLwawAe5IGnDiM1hJpH6Ev4WL9pyFd8Z++BJ
         PiXw==
X-Forwarded-Encrypted: i=1; AJvYcCXIcVqejhlfsgb5dfM9kPrVgLeqUyRG79xYav/1YqFWYH6FdRnvCWJQU6hE4Wos2MlD7XFZJ4IsW/4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWOW0GctWG9xZUX1j/0SKqRMe0kcL6i/Pc30iPXu2vzo/g+ZtS
	qQ+mRoy4cARrxkOsuQNqQhXmRI3gKFkDUrk92gOjEhq/Q6A5mBP5h3tR+G8M
X-Google-Smtp-Source: AGHT+IGjqU9c3xFXTWcj0g1hyTUMUAx/XQZlzoyodnqP8Q6HEb+UsK+AmFvHelrjIdXVko38VV1EjQ==
X-Received: by 2002:a05:6870:f70a:b0:278:209d:49c8 with SMTP id 586e51a60fabf-295e8f9f30emr4725055fac.27.1731526224577;
        Wed, 13 Nov 2024 11:30:24 -0800 (PST)
Received: from neuromancer. ([2600:1700:fb0:1bcf::54])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5ee49711408sm3143908eaf.41.2024.11.13.11.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 11:30:24 -0800 (PST)
Message-ID: <6734fe50.4a0a0220.2d2f57.f5ec@mx.google.com>
X-Google-Original-Message-ID: <ZzT-Tqo0wbqaNOuu@neuromancer.>
Date: Wed, 13 Nov 2024 13:30:22 -0600
From: Chris Morgan <macroalpha82@gmail.com>
To: Roger Quadros <rogerq@kernel.org>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 2/2] usb: dwc3: core: Prevent phy suspend during init
References: <1519dbe7-73b6-4afc-bfe3-23f4f75d772f@kernel.org>
 <671bef75.050a0220.e4bcd.1821@mx.google.com>
 <20241025224003.yfujqurxhrgzgzld@synopsys.com>
 <CADcbR4KhWdXpynk2c-tryx1=Eg4LhC4t=C6zcVHAMcMz2hH-8Q@mail.gmail.com>
 <20241029224900.by3zglncf33izsgw@synopsys.com>
 <ca4daad3-9a34-4331-9faa-91b960924b9e@kernel.org>
 <672291b9.9d0a0220.1f040e.013f@mx.google.com>
 <20241031013353.cgxjqgboz6hcy4xx@synopsys.com>
 <672d0c05.050a0220.114196.1e8b@mx.google.com>
 <9546c6f0-7cff-4661-968d-a7415134e731@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9546c6f0-7cff-4661-968d-a7415134e731@kernel.org>

On Thu, Nov 07, 2024 at 09:02:51PM +0200, Roger Quadros wrote:
> Hi Chris,
> 
> On 07/11/2024 20:50, Chris Morgan wrote:
> > On Thu, Oct 31, 2024 at 01:33:54AM +0000, Thinh Nguyen wrote:
> >> On Wed, Oct 30, 2024, Chris Morgan wrote:
> >>> On Wed, Oct 30, 2024 at 03:10:34PM +0200, Roger Quadros wrote:
> >>>> Hi Chris,
> >>>>
> >>>> On 30/10/2024 00:49, Thinh Nguyen wrote:
> >>>>> Hi,
> >>>>>
> >>>>> On Tue, Oct 29, 2024, Chris Morgan wrote:
> >>>>>> Sorry, to be specific it was the fix that causes the issues I'm now
> >>>>>> observing. When I explicitly revert commit
> >>>>>> 705e3ce37bccdf2ed6f848356ff355f480d51a91 things start working again
> >>>>>> for me. With that commit in place, however, suspend fails for me.
> >>>>>
> >>>>> Ok, Roger's patch is causing issue on your platform and the $subject
> >>>>> patch? Can you provide more details on your test sequence?
> >>>>>
> >>>>> * What does "no longer able to suspend" mean exactly (what error?)
> >>>>> * What mode is your usb controller?
> >>>>> * Is there any device connected while going into suspend?
> >>>>> * Can you provide dwc3 regdump?
> >>>>
> >>>> Commit 705e3ce37bccdf2ed6f848356ff355f480d51a91 will enable
> >>>> DWC3_GUSB2PHYCFG_SUSPHY in DWC3_GUSB2PHYCFG(i)
> >>>> and DWC3_GUSB3PIPECTL_SUSPHY in DWC3_GUSB3PIPECTL(i) during
> >>>> system suspend path, unless snps,dis_u2_susphy_quirk or
> >>>> snps,dis_u3_susphy_quirk is set.
> >>>>
> >>>> I see rK356x.dtsi has snps,dis_u2_susphy_quirk;
> >>>> Does adding snps,dis_u3_susphy_quirk resolve the issue?
> >>>
> >>> I'm afraid it does not fix the issue. Specifically when I do
> >>> "systemctl suspend" the device begins to suspend but freezes with the
> >>> kernel log output via serial console listed previously. Note I have
> >>> console enabled in suspend. Additionally button input no longer
> >>> works at this point.
> >>>
> >>> Specifically, I'm testing this with the Anbernic RG353P device based on
> >>> the Rockchip RK3566 SoC, in case you're curious.
> >>>
> >>> I'm not able to get you a register dump post suspend attempt as the
> >>> system completely freezes, however I can get you a dump prior to
> >>> suspend if that will help?
> >>
> >> Yes, any data is useful.
> >>
> >>>
> >>> Thank you,
> >>> Chris
> >>
> >> Can you help answer the other bullet questions I have previously.
> >>
> >> Thanks,
> >> Thinh
> > 
> > I have 2 ports, here is a dump of each:
> 
> Did you try this patch [1]. Does it fix the issue for you?
> 
> [1] https://lore.kernel.org/all/20241104-am62-lpm-usb-fix-v1-1-e93df73a4f0d@kernel.org/
> 
> -- 
> cheers,
> -roger

I'm afraid this doesn't fix it for me either. I still get the same
issues. I don't know if we should wait for others who report this
problem or if it's something specific just to the board I'm using.

Thank you,
Chris

