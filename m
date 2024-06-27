Return-Path: <linux-usb+bounces-11759-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FA791AA8A
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jun 2024 17:08:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CBDAAB26396
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jun 2024 15:08:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55537198838;
	Thu, 27 Jun 2024 15:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UVXkq2M6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475431591F0
	for <linux-usb@vger.kernel.org>; Thu, 27 Jun 2024 15:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719500910; cv=none; b=kt9s6eHoTTRT+xfchnAzL3BlywljL+Nv/5jPHGdB86NIR7t4pD2mPfpjEyaZvVvCISWTBX789o6yL+Fmt8ZhqXpT89qmuL12WdcWyi4PrFMaasB8+sgt+tPT5ujJ/o/kbBCPmYuMcLFW7T6sofsf/GUgqtAdZ396tam1RtcqJwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719500910; c=relaxed/simple;
	bh=uyk3FSs1lwk1fumBjvU5yqMjwXEgEW8JXSk9JLXZqa8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oUIEg7i3K6zyC8dcQUID/fp0aQQ/IJEC/LB8vzV4RQZnQSlDtgy09pb961wqY4QMBBQKdhwpHz6u16S7gGLV5qd7aaW1zj7BIKUpjkF2ggS1Z5cBg5O+3PrJRCTN8DIkm8T94MBs9gEWaXQUdGeskomDqnGMPL+rfCTT8KT3Rm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UVXkq2M6; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1f9b52ef481so64195655ad.1
        for <linux-usb@vger.kernel.org>; Thu, 27 Jun 2024 08:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719500908; x=1720105708; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XlBk62eLW/kjgbzF1XN/AbvScYXzLgjXOoZnGiz7y1U=;
        b=UVXkq2M6rvySHYa2d/JcRt4JizCK2Oq/DvwEvwqWMcQsdqPK3f6W2rLJyCcm+RacRq
         tbXhwajyDAS3DBXte8eTIUQOqw0LO23xN2n2J2KV6Dti2mC29jbFiYst1zraILpOq6tj
         Byxl7X/FgSrwFiVoGIW+6/QeOMQULG/J5SU/0kcqaWdjorWeh66xg0j1LlSzlXv7q/Fl
         NueWC5Hla0c9CAU5ZLMOkbUfcwmcL0xl8K+KrJ42UaBJh/EvGnlgCy73bujEletR9BeZ
         lPuj2A0pzhbjC4QISSC9uYOsMwZv34WVtAzwuDKHjjD8ck6llTWsz3Ns2yD+NB9WzSOl
         I09g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719500908; x=1720105708;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XlBk62eLW/kjgbzF1XN/AbvScYXzLgjXOoZnGiz7y1U=;
        b=mxaXhwdczcOuoGpXw7B7ERwD8fD4+GHy2QihTHodgx2ZG00v1bPpmnxCRZcpjN+BLL
         fj8xrn42si6TDSPrxugcXqkS0P+Kn1y0bEP7XqZc4lHdzfveSWYBHTEYx+aohIZvW+v+
         fNGIQAaUmviCtRYUn6DaFBnamQ9GGKDamwBagnexm5/KEQQDvYSCRZYwNIz78cQd8QSF
         iaS1i9ExB4DCWqCRBB/F+Iz10ycS909gn94BBrPCpqc6Uiv2umlbA4MV+hOvLkmOnkaR
         n/M/UJQxqoVB7veK1ouCil9YrCvRh1imqiwxBhIjTYteYOUa0e1slSGiivFSESSUv5tO
         GKXw==
X-Forwarded-Encrypted: i=1; AJvYcCWz7RRIOxsh9GrNfNz4BQ3GQ0rk9wfMhGs9aiXKYaQTQewxV58IxKXL2f19fkZWwFdumX5TOeDVLhh0R/jLYrazYlWF5/zP9q1i
X-Gm-Message-State: AOJu0YzPxIimmmzKQ3SZrdokl735fEfuHFGy3rJbXkM+7sYZXxc48E49
	QFfKVXOduLRvpTegZ70upR8/5ZBu0FHMmrYrmZBSSmH4ADs2CoQEWEqy1Z2hrQr5P0z+TkoohzH
	AVyHJ8fjS1rN4vPeYUmWuawwzkJqCSnv3yNVQjw==
X-Google-Smtp-Source: AGHT+IG4sxRssQrE3KkksvhzRPbEUpTAN4nLG0tK43Z2W0D0F/3wbeXfMrrZPwet93SF8QRD3aOVYoHaL5scRO2bhuk=
X-Received: by 2002:a17:902:c943:b0:1fa:ab4a:faf7 with SMTP id
 d9443c01a7336-1faab4afe50mr20966755ad.11.1719500908478; Thu, 27 Jun 2024
 08:08:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240627-ucsi-rework-interface-v4-0-289ddc6874c7@linaro.org>
 <2024062717-foster-document-eb2f@gregkh> <CAA8EJprAshnt3YchBv0ssi4Vet9b6oMcf3z8nuRkoZVYNBq64w@mail.gmail.com>
In-Reply-To: <CAA8EJprAshnt3YchBv0ssi4Vet9b6oMcf3z8nuRkoZVYNBq64w@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 27 Jun 2024 18:08:07 +0300
Message-ID: <CAA8EJpqCJ8_wOO7yLYA85KYtbLO6hvS-yb7DA6kJ2sH4QH43QA@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] usb: typec: ucsi: rework glue driver interface
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Nikita Travkin <nikita@trvn.ru>, Neil Armstrong <neil.armstrong@linaro.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Jun 2024 at 17:57, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Thu, 27 Jun 2024 at 17:54, Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Thu, Jun 27, 2024 at 05:44:39PM +0300, Dmitry Baryshkov wrote:
> > > The interface between UCSI and the glue driver is very low-level. It
> > > allows reading the UCSI data from any offset (but in reality the UCSI
> > > driver reads only VERSION, CCI an MESSAGE_IN data). All event handling
> > > is to be done by the glue driver (which already resulted in several
> > > similar-but-slightly different implementations). It leaves no place to
> > > optimize the write-read-read sequence for the command execution (which
> > > might be beneficial for some of the drivers), etc.
> > >
> > > The patchseries attempts to restructure the UCSI glue driver interface
> > > in order to provide sensible operations instead of a low-level read /
> > > write calls.
> > >
> > > If this approach is found to be acceptable, I plan to further rework the
> > > command interface, moving reading CCI and MESSAGE_IN to the common
> > > control code, which should simplify driver's implementation and remove
> > > necessity to split quirks between sync_control and read_message_in e.g.
> > > as implemented in the ucsi_ccg.c.
> > >
> > > Note, the series was tested only on the ucsi_glink platforms. Further
> > > testing is appreciated.
> > >
> > > Depends: [1], [2]
> > >
> > > [1] https://lore.kernel.org/linux-usb/20240612124656.2305603-1-fabrice.gasnier@foss.st.com/
> > >
> > > [2] https://lore.kernel.org/linux-usb/20240621-ucsi-yoga-ec-driver-v8-1-e03f3536b8c6@linaro.org/
> > >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > > Changes in v4:
> > > - Rebased on top of Greg's tree to resolve conflicts.
> >
> > Nope, still got conflicts, are you sure you updated properly?  Patch 1
> > applied, but #2 did not.
>
> I feel stupid enough now. I rebased on top of usb-next instead of
> usb-testing. Let me spam it once again

Hmm, I see what happened. I had a next+usb-next. Simple usb-next
doesn't contain changes from 9e3caa9dd51b ("usb: typec: ucsi_acpi: Add
LG Gram quirk") which this patch also modifies. I can rebase it on top
of your tree, but then we will have build issues once usb-linus and
usb-next get merged together.

-- 
With best wishes
Dmitry

