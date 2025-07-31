Return-Path: <linux-usb+bounces-26296-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C20BDB17714
	for <lists+linux-usb@lfdr.de>; Thu, 31 Jul 2025 22:21:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40C4D189C6F1
	for <lists+linux-usb@lfdr.de>; Thu, 31 Jul 2025 20:21:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4030B246BB0;
	Thu, 31 Jul 2025 20:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NtZ9zFHW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271AB1DFFC
	for <linux-usb@vger.kernel.org>; Thu, 31 Jul 2025 20:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753993283; cv=none; b=WV/NydwoHkWMX+5YpVdyyuDwueduKdxkHFC3XjaegcxDiwbnPP+9Q+UO+vW4/TLp4PANfWhJlCKx8m/JzTUNLhNKvJejJlNIAHKFNobQGgQESGS2fKbUt38UKoheku7V4V/mr70m6dFUbXlpLBsqZ/RZdUkQHGBwyGDT06OJBBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753993283; c=relaxed/simple;
	bh=0y4LA+4v7rvgMoJiSOpfdI9LQDpFwVN2DeZgyQhlKr8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eY0DCnuhXyssE82Pb7kEgAe0gRdo0/Omy7hFFxXp4Xmv+F/4THsz8/VRwtiIa+qRC1ArhrP+s/x0tcMF6k0G0K3Bz3Tr1KINJjonkc+NoDWJf2+a8ouxjZTofDKSk0GGIIKpqyBwx/gz4efcAd1J5zz366Ka52Hh7mMnICrlWQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NtZ9zFHW; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-acb5ec407b1so135587366b.1
        for <linux-usb@vger.kernel.org>; Thu, 31 Jul 2025 13:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753993280; x=1754598080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0y4LA+4v7rvgMoJiSOpfdI9LQDpFwVN2DeZgyQhlKr8=;
        b=NtZ9zFHWuumYdqCm+OWcXPzSf0QZDR8kvKAl+R86vD3ig0hDTs7/wV+6bGpHb2z0BM
         TCal7DZ8rHo8D4kEqG/9t2ELvjsAxRkEL7w+F7Rn/bklIfeiBtLHQrYPl8uYQ8CQDDXr
         B8vqJVl+JcoA0nwdEVJ5QTjxOGovk2ufDyrWXajN/x6tNhsDJI534nlTvBre2/UqfLLI
         xiwAcTMIs587ilQMv3iK9Q0vB+yMykORCoAHjMyv6FoJJwuTJ3CHvzTznbIcPKlXrnpr
         75Iufe0YH2WZkFkn3jFJUuNJqMJIq9QNNuDVwN0uRPlDDXzZFq168+cTWL07PA9/vzxC
         O9vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753993280; x=1754598080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0y4LA+4v7rvgMoJiSOpfdI9LQDpFwVN2DeZgyQhlKr8=;
        b=TcuOFr8rFe97WUklhyIjkfthB9rrO9TRjBl6A3FAtNSyOxSwDlnBgrs0CKfT5ImkTk
         7grtntjamIJB16NHTUHHf0aka5MBS4miwOrV7ibo+TXWd19wRd5FWIQem/sws1wggira
         oo0m/ssQaDaAZVsxBogEppGIELpQHrsyQP3GKXo6y4fY/6MqfV4J1ggcxdgEDicQ9D4i
         6ArSLqQ+IofduZB28D8MmYkOgnCVyqbPf1zFPCTmP3yTiPesJJcU7OPIeFWzhsR6gIUu
         v9Z4BgsxehQUAgKJ+9BE95gpAip1x3dgWZoRV+PyHqoXTBze6u7ttT5zyBzLp6kd8T0K
         vAMg==
X-Gm-Message-State: AOJu0YwMhG8ZKd2YJsJCrlRQ/Pvs5agujyCNa8xIx3XJ02phW/gpQkds
	q+eTnDY/yiY90MqR2hgcAVyZirtq7V5IekG80oK0pvBlq7vHzmWtlEmJ
X-Gm-Gg: ASbGncuwedYc0PMsAqeCDPhIFYwbiFwABAnYnFQrcxkMfR7iEMoV6Acp54wW7qcbVXF
	Jw1lWwIhCey2pTfYoTQ9yu4kMbptYlrXrenJw8H2PM/gkZIGY4ax5ZhSl7ictvGPi9N9XRLJ3SA
	HCVJDbViS5ucDcPyNvEklpK+5B4yitCzJd39op3WaJYd0RDFzN3TwUb/61NBBIIQQKA6YhZWlmK
	KqxVzqCFKrVOnIIKZtP6ndHArjyBsxQBnjvZyoNV/CeT9Fhvmvb84w9/5geQQaY8B9mpDlLcoyw
	L7n4cijYzjV+n+W1MBw0xui/WguuyBdgLBAgGS5DFXWlcj+2AzWrud9pmevca8wCWjFS/LaYWa2
	6buyYHnFRB8I/G/aZ6ompyjfJJpMEGbrrWMZXh6IDamsm5EzQec1zpAfn
X-Google-Smtp-Source: AGHT+IFCTVQG2b1ex9j5f4zEXIpCSs24a4MWhePwUneTqiIOMfdkQJHF8InBDyfCTJU3wqYBGO2ykA==
X-Received: by 2002:a17:906:478b:b0:ae0:c943:785c with SMTP id a640c23a62f3a-af9318b8e39mr17627066b.35.1753993280231;
        Thu, 31 Jul 2025 13:21:20 -0700 (PDT)
Received: from foxbook (bfk202.neoplus.adsl.tpnet.pl. [83.28.48.202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0df2e4sm163007166b.62.2025.07.31.13.21.19
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 31 Jul 2025 13:21:19 -0700 (PDT)
Date: Thu, 31 Jul 2025 22:21:16 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Robert Ham <rah@settrans.net>
Cc: linux-usb@vger.kernel.org
Subject: Re: Audio interface causing "xhci_hcd ... WARN: buffer overrun
 event" messages
Message-ID: <20250731222116.79b15493@foxbook>
In-Reply-To: <87114caf-7c0d-4e51-bb3e-f171fc20ac62@settrans.net>
References: <ba0ebd17-dade-4a97-b696-5ad19ebfca1d@settrans.net>
	<20250731101720.5d10a8f1@foxbook>
	<87114caf-7c0d-4e51-bb3e-f171fc20ac62@settrans.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 31 Jul 2025 11:04:40 +0100, Robert Ham wrote:
> On 31/07/2025 09:17, Micha=C5=82 Pecio wrote:
> > Can you mount debugfs and see if you can find the directory below? It
> > would tell if there is anything unusual about those 1 in 65 buffers.
> >=20
> > /sys/kernel/debug/usb/xhci/0000:00:14.0/ =20
>=20
> Umm.. and this is with the device connected and snd-usb-audio loaded,
> which might be more helpful :-)
>=20
> /sys/kernel/debug/usb/xhci/0000:00:14.0/
> /sys/kernel/debug/usb/xhci/0000:00:14.0/ports
> /sys/kernel/debug/usb/xhci/0000:00:14.0/ports/port01
> /sys/kernel/debug/usb/xhci/0000:00:14.0/ports/port01/portsc
> [...]

Actually, the useful stuff would be contents of some of those files,
but the trace you posted later provides similar information. And it
looks like you will need to dig into snd-usb-audio some more.

FYI, scripts/get_maintainer says that the relevant mailing list for
that driver is linux-sound.

Regards,
Michal

