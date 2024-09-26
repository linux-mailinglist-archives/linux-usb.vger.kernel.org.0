Return-Path: <linux-usb+bounces-15504-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E20D19873A0
	for <lists+linux-usb@lfdr.de>; Thu, 26 Sep 2024 14:32:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 54902B29C3B
	for <lists+linux-usb@lfdr.de>; Thu, 26 Sep 2024 12:32:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0243D28FC;
	Thu, 26 Sep 2024 12:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X07yFnFM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15583322B
	for <linux-usb@vger.kernel.org>; Thu, 26 Sep 2024 12:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727353916; cv=none; b=czrzBPmvqK+QshZXqs2pCH1v6BmfJmuVjFK9EZyPHOQlETOiuvKFt/EltQVhTOSBglRSNWoJszGE9jGry7gMD5LLk1Sn0xOOjzEk7WFxZyvFMtST/53xQ01Sd1Bfu//UUFwpWQfgvMx0KAMYeca7GI/l9b38lGRB3xeAs1zSQWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727353916; c=relaxed/simple;
	bh=mCthW15WhI930vnar/bIOU0gxyKjH6j4NSrfELJCAek=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bkmR8S+593s31u2HkQ0ZzI2fka/Tiny593hXsW25S/SGhEt6fvEkiliiUJEHyJQHwtDw6JArigc8Fs20mXE5fYVWb5JdM137n1lI2IgLHp1n71B0Vl7W9r8p0D7CrxljLstH7n5RFoPLaye50H9Pe9Ii1QHE2W5SW4H0QPeIU9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X07yFnFM; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6de15eefdd3so8582247b3.0
        for <linux-usb@vger.kernel.org>; Thu, 26 Sep 2024 05:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727353914; x=1727958714; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=u4a3QtXEUpHAVm+ZK+N+HQKk1DStI8szpt5V5LT2xTA=;
        b=X07yFnFM8BDYit6JK+glG5G2FA41NQG4MERPLj6TAg2taTUmfOMQeCWoEDmy2p8WdM
         f3L0qw1d8MVrUdmJ+nuCXV3QqX/M2wsAIFZFiH/M2fEZtAwOMXQ0GDuVa+OwavmA2vZm
         PKdsfk7vVLBKgitTl/klBomW3MuJZ5re2YjWEqDPjjWmtcLQf+YkwKGUJnJ4AecUsbTT
         kIqL1GDBBNkaUsAkOh6cHyua2CO6h4lLVcvxnh/B2TA+rwnJvyFqXqcILhuXTeawnN5C
         sWh/OSsZN5f5+CzPMC/RUFS+nIcxx498qPnRA3uPZep97XfcOsb9xVqcNkY1KE0ltBI3
         RBbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727353914; x=1727958714;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u4a3QtXEUpHAVm+ZK+N+HQKk1DStI8szpt5V5LT2xTA=;
        b=NTQsf8bkweIgMOENfpiWVANYX8HEZgJWwVzAruY+NM5RusUfidxv1X9Qj9K0zPG68N
         excbc8eJYihTaA0XlFjP/c2cTgZmmyBnx3DXwnDaBxdiECQeyU0n09p9G0ELdxenOY2Y
         YBpiQaJDfBpoIgeUb1urQr2ZrSBq68CJGX+U/t56HGYsRzuffbQqyr4KyH79SFrt+iPV
         b/p928Vcw83vHaJuMTGVWXwBNGiVxPA69TczKhHLieWSZcGSCyYQTHbFcIEVoPDNPvbs
         9FntK9eoB0THuD1Rq4ScR2PPqmpmpqsa0MDDTgBenu9ufoAm2QGzeY/oksOK+5lboHk7
         seeg==
X-Forwarded-Encrypted: i=1; AJvYcCXd1UxFdDRF+sj/rrRRqsxMO2DmC8z5WpGGut47lPiYEZI3kXU/sPUv39INr6ELBWyoJnv9tZhepEI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwF0yICXE6GxcC6xjAjAkTZ1dBrzqDReQ5Yu7XBDYlab1Lkczux
	KT2UtDaYtPuuo6TdA28oG00LvYGdEPUkcaA6mt1yG1wKEetoMbHbaVXYEWuXEmBCF2t445FL0Lw
	c94Szz/jYy6RGck5QsF4gs/Tm+LkYsgHaEP/SVQ==
X-Google-Smtp-Source: AGHT+IE29PkpeUSyt7nuSyGgj69wjdmICcREmjZKRDgH/DNSmFafaP1zk2QtLSNTp6vj8RrxGQTq1KdSdrzDhYgGe2Q=
X-Received: by 2002:a05:690c:6789:b0:6db:d5e8:d612 with SMTP id
 00721157ae682-6e21d86349amr48398477b3.23.1727353914042; Thu, 26 Sep 2024
 05:31:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <b890361e-e99b-43da-8571-7478b5eab475@web.de> <jjsbnitbajdw7dc4plkbb55ezl2cdbnrfws7hnoigbzasvdzua@puhrwwlu4lvv>
 <ZvVPlInCFajkeFy9@smile.fi.intel.com> <CAA8EJpo0Q0Wn-GzqmPeNFfG_Hr-o8E7F_VuO47EbxKx=0OQhyQ@mail.gmail.com>
 <ZvVTMyn9VtuT-tIr@smile.fi.intel.com>
In-Reply-To: <ZvVTMyn9VtuT-tIr@smile.fi.intel.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 26 Sep 2024 14:31:42 +0200
Message-ID: <CAA8EJpoqm_n-WrQq+77wStCxVMU1ysQthStReK3kS3MaMaYSUA@mail.gmail.com>
Subject: Re: [PATCH 0/2] usb: typec: ucsi: ccg: Adjustments for common code in
 two functions
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Markus Elfring <Markus.Elfring@web.de>, linux-usb@vger.kernel.org, 
	Ajay Gupta <ajayg@nvidia.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Haotien Hsu <haotienh@nvidia.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Utkarsh Patel <utkarsh.h.patel@intel.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Wolfram Sang <wsa@the-dreams.de>, LKML <linux-kernel@vger.kernel.org>, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 26 Sept 2024 at 14:27, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Sep 26, 2024 at 02:20:19PM +0200, Dmitry Baryshkov wrote:
> > On Thu, 26 Sept 2024 at 14:12, Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Thu, Sep 26, 2024 at 12:26:24AM +0300, Dmitry Baryshkov wrote:
>
> ...
>
> > > but in any case the thing is that kfree()
> > > probably can be done using __free(). Then PM runtime handled differently.
> >
> > That's a separate cleanup in my opinion.
>
> Yes and for that we do not need an intermediate change, right?

I don't have a strong opinion here (and I don't feel a strong need to
move existing code into using cleanup.h just for the sake of it).

-- 
With best wishes
Dmitry

