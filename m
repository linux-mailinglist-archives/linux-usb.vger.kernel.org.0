Return-Path: <linux-usb+bounces-9382-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 663218A628A
	for <lists+linux-usb@lfdr.de>; Tue, 16 Apr 2024 06:46:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 88DD91C20BB0
	for <lists+linux-usb@lfdr.de>; Tue, 16 Apr 2024 04:46:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B783F2E622;
	Tue, 16 Apr 2024 04:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ek+qDG7w"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1528779C4
	for <linux-usb@vger.kernel.org>; Tue, 16 Apr 2024 04:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713242779; cv=none; b=dKRLNQmJraEwrEOIFZotSUO9N+QXfh9luEcj6ECWji6vtuH/GY7GWwU/VAi6ArSlwQfosSA7/dYc0FJehL2xaIogc6rSG5eZuF1v1NuIuiPYp5e+AwMjpj1zjf+IqNGvg6O96bsmdC4ygjoaVrbiXp7/HumMZTFLCDmLfOEEsh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713242779; c=relaxed/simple;
	bh=S6DyjYm1vXJbiAuVWQcX0+MLVrQHQLq0SWJGOHdI9x8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VwYCnoYTrrl+4cedKCRaW+rxi+gHttjqEAw/2GeGfdkZaBPtKoC+LO64sVTeTwqwQmFRGwmbj4C5qdGZHoONk0AkjRO7QUxKQDA5pcZW2Lu24lOfb8H/YHcz13fH2bU4v8XSGI2YazUXZRqA49oMVZ42sG0MXEPF2KFaRoEBITo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ek+qDG7w; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-23335730db1so2319789fac.2
        for <linux-usb@vger.kernel.org>; Mon, 15 Apr 2024 21:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713242777; x=1713847577; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=S6DyjYm1vXJbiAuVWQcX0+MLVrQHQLq0SWJGOHdI9x8=;
        b=Ek+qDG7w9sKi98JyKfw47OFhGO4/E9CssPkDzNi55uUgMGSq5xirN1R2VI7EcxxvBn
         /4k+dzNOmIEL1CfPw12ktIZeIhdJSOk+gXawaFTpdZOVXmgaLG2145p7Cjy3wu7W5HXl
         Jvu6qwroEgKcH8fb6H3tbRL6kaYfhswxYBpz/AKrYuNNdjJSkrGqNS6EbR4rfSK7csse
         6e8S8RujvqK7kabUuhG4M3DpeYnfCCaKLYsTq1lf5taTCUedis+LOWdqmQRwdpznkITu
         3iTRzfDEQIIY+h/RP43fb5MO9e6/XiVABA7U1M2xz4yqK6oi60IZa2HW0rgTpps2pqth
         DruA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713242777; x=1713847577;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S6DyjYm1vXJbiAuVWQcX0+MLVrQHQLq0SWJGOHdI9x8=;
        b=ARD6hHCUPz4gl75PLb0MrIbvtIFxH01UDBtihTs/fmxU9rSZjzElgzqJjyzMv+292/
         Q+5P72Nfzzz9hMbzkOF4fiqVuF2vFM5PGDaVpXHF+OWIX2ZrjJntDTSi2toLAdSfNWi1
         YJZ/tajKMTrW2aABiC6oDgjgapyiUC9LaA+6SG2cEEjKZPGt7dGa8CFxFOKmOrtXp/mE
         rQeSh5/2MV1QIYjLwmcU7Cpk6sXPHpmvSFQMXuI7I7Zv/UC4wCG/OCC75wRw4rmhE3dD
         fVvlVTaIGQbzVMbF7HKOvWflD2K31sM7P3e16VH5NzMYCqy5xollx0zwqIRETAIaIm9H
         3Xcw==
X-Forwarded-Encrypted: i=1; AJvYcCUWJKllNW7ZnPxNwykW3oC0dAF9+9H1CxP8cV0h1SUBjEL/5ksVmcO3q+1ZKrHsTISkINN/DbU1xGjNH3FaFsvoUEErcFEkf876
X-Gm-Message-State: AOJu0YzSpPQAvaUeWcAFlmDyJHpatO0eZJPsQx39IztXMPnq45y0SLJ0
	z2KgF3fxrOsFNhSOQUb1esc06APwaIKXdBkq0XvM/RVE2gjkSP4dGzVXCq2wKv2m3DxyYWTQBQ9
	W73o2slzIKDtikpWbnzk2lnVqwN7c+Q==
X-Google-Smtp-Source: AGHT+IEYr6vbikYmoNHpLF6hLm+hobgUmGPFBHqMeW/KrNGLRX4sIFeoPfOs4PrloVWlMKNkquW1EdufGL57Ixus5NA=
X-Received: by 2002:a05:6870:70a1:b0:22f:70da:1f26 with SMTP id
 v33-20020a05687070a100b0022f70da1f26mr15160058oae.27.1713242777160; Mon, 15
 Apr 2024 21:46:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240412142317.5191-1-linux.amoon@gmail.com> <20240416003111.n55mcgszumhdbnpo@synopsys.com>
In-Reply-To: <20240416003111.n55mcgszumhdbnpo@synopsys.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 16 Apr 2024 10:16:01 +0530
Message-ID: <CANAwSgRne6nuUEUyjgm=W4LD=gqxdXyV+YVqHwxjtnBT_Tmy4A@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] Use new helper function for clock and regulator
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Johan Hovold <johan@kernel.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Thinh,

On Tue, 16 Apr 2024 at 06:13, Thinh Nguyen <Thinh.Nguyen@synopsys.com> wrote:
>
> Please Cc linux-usb.
>

Yes, I will do this next time.

Thanks
-Anand

