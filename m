Return-Path: <linux-usb+bounces-12633-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C61941045
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jul 2024 13:12:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 714691C22902
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jul 2024 11:12:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C29761990BE;
	Tue, 30 Jul 2024 11:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T62cmI0G"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB733195F3A
	for <linux-usb@vger.kernel.org>; Tue, 30 Jul 2024 11:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722337959; cv=none; b=d2ioEHqCUX+PJzpgX2DfeSabyf5RryxVxoi/EHjwRkhQRAqwkaTjMawC2p7uC7pEKL0xtlToOU1Cb4g8uge9Ng1tCtPTzKnlN6aPmCdtIU+VLycyE5PbcGs3BqCtP453gLGcu+YNNO/oBBcSX2TSbLFZK66c7sq5Z79nk0WNVvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722337959; c=relaxed/simple;
	bh=N7lqSf5AO0WbYGPFlk+06BHDm4ESUR4XJgtnxoK2O70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RwxNi5CpuPbDSZ7ovYgthqMUfrzrJpYLHqYrcFoi7GIophT+Kfm5xqcHuJiJAAfCkAgnLbRCiqhraa6yTgL43m/4ofchREmErbSdl/HAwfzc7Cslmp1eAtOp4rUlDwzU2BtTG+DaW2OrbtxXedQD8EEiNmz3RbiYF+UYJbFUQ5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T62cmI0G; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52efdf02d13so7094835e87.2
        for <linux-usb@vger.kernel.org>; Tue, 30 Jul 2024 04:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722337955; x=1722942755; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3HozFc70ppioaxUQeurqe5EazU/NJguJmDUXHTU07LQ=;
        b=T62cmI0GgxckjugsjcF9kDGQmOjO0rCt5VXm13VBqHrPzrDCpjkX+IUHbAVEK8B91X
         ceXsebNBonQxtXF+H8V7A2t1hq6Tf8L+lhHlMZtXduo09HKC9CPsUe0TQbVBbtpmxe37
         gEXqBLWzzj2zLi57Z9Ikh+xd6Zl0SzRPdSNJpXvalA5Erv/lXCYKDAzw1wLhw2XcI7wi
         EUERhxzbURpJU+EcKJCkotLhonW3VcgvV88gLKQ8A8Zfnu+k2MAbtraE8JKqNIgj3cV+
         tL0u5hOMvhfy0hqg66HpqrDpmTVwqImWwkKMRdHe37YyemAUrC12FTsFB79tqtb+Bdf7
         x1vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722337955; x=1722942755;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3HozFc70ppioaxUQeurqe5EazU/NJguJmDUXHTU07LQ=;
        b=RrEcAAjM+IBiF7SWqp7zRfGAfNkgad/9+jCQiRi2dFQtsyEEt6hT0MijwErAnGfKVp
         zZsz7McOsifyx/ovWNlI2EEYpaDni6ET3a5pyG2Yy77sijRXcnk12Ot38JJ3zhzV2kWb
         zbg79RHjniFr4xY+YOO9L0RhBCtKz8PGt0SEytKM0ntNRkfaCGRp6mpkCa/xUtWPfCnf
         yaTxPrFU+HO6k7x/0PLIf81fAT9Bs3p6Htd3HnoO4aIjzvhTaTGYanX0XuFm+Ljdk2Su
         f/Jwqre6Ktzr6FbgDI6vgEu7lqtm1cwfFHD9h35srBjRYAbHJ1QT9okUVMOZsujJ68GC
         tmHg==
X-Forwarded-Encrypted: i=1; AJvYcCXSxXU93XtkmLj6cLFQuHmFPl/5/tbCj01FsBOaLpXiThsc//fPpRmCV42JvDaXdpJLPxApuvms0AiMxE3xTkqmdRqE8NZuXXYI
X-Gm-Message-State: AOJu0YzjXItJC6XwJUQs8qjIU0neI96BLtk/VRhxfqeJAlYi8ASAXHsK
	guJG54QPUBoL14wTDqil1po9ysUMYlnho2FaBctAzlqL1C/PjKK8tSxUS+VJZVs=
X-Google-Smtp-Source: AGHT+IETyOU+BVaq0nxGbsyKgG83TJMfWwawfhmuw27Fu8otQEXo4m3r5dLoEMYAGXZwPrSqaMrXcg==
X-Received: by 2002:a05:6512:39c1:b0:52e:fa5f:b6a7 with SMTP id 2adb3069b0e04-5309b2706eamr11020166e87.13.1722337954674;
        Tue, 30 Jul 2024 04:12:34 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fd5bc414esm1848644e87.22.2024.07.30.04.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 04:12:34 -0700 (PDT)
Date: Tue, 30 Jul 2024 14:12:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, andersson@kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, jun.li@nxp.com
Subject: Re: [PATCH 1/3] dt-bindings: usb: gpio-sbu-mux: Add an entry for
 PTN36043
Message-ID: <7gojzjkcpq753x2eb67osvvwfzxytqkm6sxm5qyank4qpdmdnb@mdunl7yq5wd6>
References: <20240729081039.3904797-1-xu.yang_2@nxp.com>
 <a3trxkx2fue2oahscjkc4silnfhesrws5xn7brjefjmke5emci@dn3cbb7yzmux>
 <20240730025844.b647xuoolg6zq6f5@hippo>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240730025844.b647xuoolg6zq6f5@hippo>

On Tue, Jul 30, 2024 at 10:58:44AM GMT, Xu Yang wrote:
> On Mon, Jul 29, 2024 at 10:57:33PM +0300, Dmitry Baryshkov wrote:
> > On Mon, Jul 29, 2024 at 04:10:37PM GMT, Xu Yang wrote:
> > > Add a compatible entry for the NXP PTN36043 GPIO-based mux hardware
> > > used for connecting, disconnecting and switching orientation of
> > > the SBU lines in USB Type-C applications.
> > 
> > NAK, this is not correct. PTN36043 switchies SuperSpeed lines and not
> > SBU.
> 
> Yes. Since this gpio mux is able to switch both sbu line and ss line,
> I will change SBU to SuperSpeed in next version in commit message to avoid
> confusion.

Ack. This needs new compatible and probably more schema (and driver)
changes. I think you can't just terminate SS lanes in the mux, they
should go to the actual SoC part (like the SS controller or PHY).

> 
> Thanks,
> Xu Yang
> 
> > 
> > > 
> > > PTN36043 datasheet: https://www.nxp.com/docs/en/data-sheet/PTN36043A.pdf
> > > 
> > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > > ---
> > >  Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml b/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
> > > index 8a5f837eff94..152849f744c1 100644
> > > --- a/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
> > > +++ b/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
> > > @@ -20,6 +20,7 @@ properties:
> > >      items:
> > >        - enum:
> > >            - nxp,cbdtu02043
> > > +          - nxp,ptn36043
> > >            - onnn,fsusb43l10x
> > >            - pericom,pi3usb102
> > >            - ti,tmuxhs4212
> > > -- 
> > > 2.34.1
> > > 
> > 
> > -- 
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry

