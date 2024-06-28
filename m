Return-Path: <linux-usb+bounces-11779-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE8B91C0D0
	for <lists+linux-usb@lfdr.de>; Fri, 28 Jun 2024 16:25:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD1851F22617
	for <lists+linux-usb@lfdr.de>; Fri, 28 Jun 2024 14:25:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C3441C0046;
	Fri, 28 Jun 2024 14:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S1iDHBLO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22A41BF333
	for <linux-usb@vger.kernel.org>; Fri, 28 Jun 2024 14:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719584734; cv=none; b=mNFEYrgavXgmMB2aHPRujA4LB30uwJ4y4Zn4//8FBis38BSlvehqosIeld8rYN45ZIE61j1H1f4gWOeyVgleIJB88S/dcofpEkTjFrBCXwVVhkCbV1DNuXCJ4dpvthJvE3h/5MOxcc37mfBGcumvtCsg6pQZTr3FQDM5+4ofALI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719584734; c=relaxed/simple;
	bh=Sca9heCYzPNqZOuh91bo5j7Bf6Gy2w1eZjtipZWqzkc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FzLOwVS1xG+ekBrmcn1ynaXlM3YwSV1HFLGwGuS+WN8LNW/YuFEIIHRXsXVuczLLjSbfWbPojnRKGpVF2rQNFhUHLZuwWsnBgqavaKJq7HUNmMIEa7gHnPFYNvgl4k6W1RGRJ3+cE0YndOrHri4pN3BIkPX0G9sz2xWrK2h6pvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S1iDHBLO; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-64a6bf15db9so6431537b3.0
        for <linux-usb@vger.kernel.org>; Fri, 28 Jun 2024 07:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719584732; x=1720189532; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wrEi/WACEa6FBCLeXGH4a1qm/TO6DqKPmGGcMFyn4W0=;
        b=S1iDHBLOH1K7T+bAqtsSXQu1mMDjfPrjkicrxPH1NY7gsfrrMUqTNyE3Woxzpf9YsC
         TVuZdbnNk3EuNx1l700iIjXfXwLyAwoDXBcCMUgnYnlvrErmbRYzvqSuTQUkx8MzMyb4
         vmJcFx94zC8ZMwwDzwjFTUUB7DKK/V/gsD06I+XJ5E8nBxEcR2I5Z7S2rTDJf6glHjjA
         yqGXrvjnzWWu8cBWBxxC0EjqzpolxOSuCNop4hZDQYsftdsGOCgu7UlC0XSX+0P5A+w6
         TGOiZCRHl4Nzv5JfW433cMJxgbLBCn43wWk//NRSPQakxRg/9jvmaNXa02qki6vGoJcz
         U6WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719584732; x=1720189532;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wrEi/WACEa6FBCLeXGH4a1qm/TO6DqKPmGGcMFyn4W0=;
        b=f0oSagdu9Lyyakqy9dsoQo9VivQNTSv5cd0CRRFKk8iUEQeImyb5iVAuXK9hxzFHrh
         /S6cu9oR3kMODHj6PGYEDejcHpKl+gcbR3dNvh8lUrgNr6znIe+4bYsiBvdh4LJ4N9Hk
         mWAG/le7r8gHp91S78ZeUGU4VM/aUgQP64Juk3v1zmryglgD/r6mnYjMfSmopsDUeK5K
         pAqnHEQUibOurFISCnve7HR1rJsfB8O9uAjTccsXIR7JFpMGkd1G/yQ+2LhOD3VlvmM2
         gjIVtGouZuTCzqPqWNI+nspCpsfCgaWw3bqAE0L71SVBIOmmQuHKCXGR5KVb1Y515R6q
         1qKA==
X-Forwarded-Encrypted: i=1; AJvYcCV8IqiVvGNJb4NP2hZHj/2urOz6LholtFHLUxEK7s2ApHRFKPNjgyJTb92KymUIQHntXzkSpUO4GL8U+ETZfgAMb9gksi5e0Bvd
X-Gm-Message-State: AOJu0YzNRUh3pb4ecT+D/ILdYDDHcZsQ1AqTRHqob0Vq2ukySSD1o4fg
	uXREZzqF79cMsgy5DhhWK6JP8e15off7w/WO0NmM1G3lF2YbrefhGkF2rVCz73XiGL/WmfNmzkw
	3NDJq7tZc9EkIWu9Ca6nlk5oLBvhh8IWnd8UZ1Q==
X-Google-Smtp-Source: AGHT+IGj8wVl5pbaPJkk0Ot2oWBFmKObQZKDXj4G/2axlfG0NZXI9SrYjaAq5/esf9Gfy7A4E0YOFo/bQa5SOx4UVLE=
X-Received: by 2002:a81:8444:0:b0:64b:5cc7:bcbc with SMTP id
 00721157ae682-64b5cc7c0f9mr11323487b3.32.1719584731747; Fri, 28 Jun 2024
 07:25:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240627-ucsi-rework-interface-v4-0-289ddc6874c7@linaro.org>
 <2024062717-foster-document-eb2f@gregkh> <CAA8EJprAshnt3YchBv0ssi4Vet9b6oMcf3z8nuRkoZVYNBq64w@mail.gmail.com>
 <CAA8EJpqCJ8_wOO7yLYA85KYtbLO6hvS-yb7DA6kJ2sH4QH43QA@mail.gmail.com> <2024062825-balancing-resigned-e383@gregkh>
In-Reply-To: <2024062825-balancing-resigned-e383@gregkh>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 28 Jun 2024 17:25:17 +0300
Message-ID: <CAA8EJprsJLMTnd9epLR4Uc02Vg2veW1mpqFxxL=rHU9DtJ8UqQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] usb: typec: ucsi: rework glue driver interface
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Nikita Travkin <nikita@trvn.ru>, Neil Armstrong <neil.armstrong@linaro.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 28 Jun 2024 at 17:24, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Jun 27, 2024 at 06:08:07PM +0300, Dmitry Baryshkov wrote:
> > On Thu, 27 Jun 2024 at 17:57, Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > On Thu, 27 Jun 2024 at 17:54, Greg Kroah-Hartman
> > > <gregkh@linuxfoundation.org> wrote:
> > > >
> > > > On Thu, Jun 27, 2024 at 05:44:39PM +0300, Dmitry Baryshkov wrote:
> > > > > The interface between UCSI and the glue driver is very low-level. It
> > > > > allows reading the UCSI data from any offset (but in reality the UCSI
> > > > > driver reads only VERSION, CCI an MESSAGE_IN data). All event handling
> > > > > is to be done by the glue driver (which already resulted in several
> > > > > similar-but-slightly different implementations). It leaves no place to
> > > > > optimize the write-read-read sequence for the command execution (which
> > > > > might be beneficial for some of the drivers), etc.
> > > > >
> > > > > The patchseries attempts to restructure the UCSI glue driver interface
> > > > > in order to provide sensible operations instead of a low-level read /
> > > > > write calls.
> > > > >
> > > > > If this approach is found to be acceptable, I plan to further rework the
> > > > > command interface, moving reading CCI and MESSAGE_IN to the common
> > > > > control code, which should simplify driver's implementation and remove
> > > > > necessity to split quirks between sync_control and read_message_in e.g.
> > > > > as implemented in the ucsi_ccg.c.
> > > > >
> > > > > Note, the series was tested only on the ucsi_glink platforms. Further
> > > > > testing is appreciated.
> > > > >
> > > > > Depends: [1], [2]
> > > > >
> > > > > [1] https://lore.kernel.org/linux-usb/20240612124656.2305603-1-fabrice.gasnier@foss.st.com/
> > > > >
> > > > > [2] https://lore.kernel.org/linux-usb/20240621-ucsi-yoga-ec-driver-v8-1-e03f3536b8c6@linaro.org/
> > > > >
> > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > ---
> > > > > Changes in v4:
> > > > > - Rebased on top of Greg's tree to resolve conflicts.
> > > >
> > > > Nope, still got conflicts, are you sure you updated properly?  Patch 1
> > > > applied, but #2 did not.
> > >
> > > I feel stupid enough now. I rebased on top of usb-next instead of
> > > usb-testing. Let me spam it once again
> >
> > Hmm, I see what happened. I had a next+usb-next. Simple usb-next
> > doesn't contain changes from 9e3caa9dd51b ("usb: typec: ucsi_acpi: Add
> > LG Gram quirk") which this patch also modifies. I can rebase it on top
> > of your tree, but then we will have build issues once usb-linus and
> > usb-next get merged together.
>
> Ah, you need/want stuff from both branches, right?  Then just wait until
> next week when my -linus branch will be in Linus's tree and then I will
> merge that into the -next branch.

Ack. Maybe I'll post another iteration based on the discussion on the
mailing list.

-- 
With best wishes
Dmitry

On Fri, 28 Jun 2024 at 17:24, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Jun 27, 2024 at 06:08:07PM +0300, Dmitry Baryshkov wrote:
> > On Thu, 27 Jun 2024 at 17:57, Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > On Thu, 27 Jun 2024 at 17:54, Greg Kroah-Hartman
> > > <gregkh@linuxfoundation.org> wrote:
> > > >
> > > > On Thu, Jun 27, 2024 at 05:44:39PM +0300, Dmitry Baryshkov wrote:
> > > > > The interface between UCSI and the glue driver is very low-level. It
> > > > > allows reading the UCSI data from any offset (but in reality the UCSI
> > > > > driver reads only VERSION, CCI an MESSAGE_IN data). All event handling
> > > > > is to be done by the glue driver (which already resulted in several
> > > > > similar-but-slightly different implementations). It leaves no place to
> > > > > optimize the write-read-read sequence for the command execution (which
> > > > > might be beneficial for some of the drivers), etc.
> > > > >
> > > > > The patchseries attempts to restructure the UCSI glue driver interface
> > > > > in order to provide sensible operations instead of a low-level read /
> > > > > write calls.
> > > > >
> > > > > If this approach is found to be acceptable, I plan to further rework the
> > > > > command interface, moving reading CCI and MESSAGE_IN to the common
> > > > > control code, which should simplify driver's implementation and remove
> > > > > necessity to split quirks between sync_control and read_message_in e.g.
> > > > > as implemented in the ucsi_ccg.c.
> > > > >
> > > > > Note, the series was tested only on the ucsi_glink platforms. Further
> > > > > testing is appreciated.
> > > > >
> > > > > Depends: [1], [2]
> > > > >
> > > > > [1] https://lore.kernel.org/linux-usb/20240612124656.2305603-1-fabrice.gasnier@foss.st.com/
> > > > >
> > > > > [2] https://lore.kernel.org/linux-usb/20240621-ucsi-yoga-ec-driver-v8-1-e03f3536b8c6@linaro.org/
> > > > >
> > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > ---
> > > > > Changes in v4:
> > > > > - Rebased on top of Greg's tree to resolve conflicts.
> > > >
> > > > Nope, still got conflicts, are you sure you updated properly?  Patch 1
> > > > applied, but #2 did not.
> > >
> > > I feel stupid enough now. I rebased on top of usb-next instead of
> > > usb-testing. Let me spam it once again
> >
> > Hmm, I see what happened. I had a next+usb-next. Simple usb-next
> > doesn't contain changes from 9e3caa9dd51b ("usb: typec: ucsi_acpi: Add
> > LG Gram quirk") which this patch also modifies. I can rebase it on top
> > of your tree, but then we will have build issues once usb-linus and
> > usb-next get merged together.
>
> Ah, you need/want stuff from both branches, right?  Then just wait until
> next week when my -linus branch will be in Linus's tree and then I will
> merge that into the -next branch.
>
> thanks,
>
> greg k-h



-- 
With best wishes
Dmitry

