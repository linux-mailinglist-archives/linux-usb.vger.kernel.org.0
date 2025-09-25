Return-Path: <linux-usb+bounces-28647-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EB5B9D0DF
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 03:47:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 17FEF4280B1
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 01:47:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8D4F2DF12B;
	Thu, 25 Sep 2025 01:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kSzah0SW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2FC23ED5B
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 01:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758764807; cv=none; b=EjqnOf4iTvM3grGwW02LWKxrrgUd28AlliHA9w7lRGslO+/r+wG2klbUABQbGG1SIScI8p89YpC/OxBAbPBehazNZ/A8OxNVLLdeoyi01pXjowviYAjZa/JpUlhw4rO9lLwCShEYFnNXEOBYNiFJNXr/fIWlr9O05Eb01kf9v0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758764807; c=relaxed/simple;
	bh=qIjm0b0AslPdWaTIs2WPD6UpwsjtkfrF/JhmN6MqGNM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X8PENmcTI3xZYJWUCe9RFnMhsVz+PF0yFR7J/DOEKr0WmJRBaC8h0wxCLLg7HO3U2CxlHpPUsRe8dAelogwJTlLz7Oe4ACsNoDyYT/qsTcab8lXhlCZGqrO3khyo65Gy9mehSrXUf5BvbwjoN22R134ew4S3txw/wZqRxWBjQPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kSzah0SW; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2445805aa2eso4538605ad.1
        for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 18:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758764804; x=1759369604; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=85fJuIkIL0zFa5NAmKr1mvE2dYhK1JVFush8sn/+tyk=;
        b=kSzah0SWohiOvVb8aVH4abFglRNkagkum6PYJCgN3rniiNUih5RybhLiEg93MCNcIw
         YVyrm/OhZWv/SjTLuZblurmt8iJpSOo3tCSnQyOvGnoERwg1st02vfqt8UhkfaAnAHwj
         iXpFGOned0mJCcmwWG4Baoo6dnEknaqIgxpSBaNaqOkNYA4EqrzY/W5rwTjqyZmPooMG
         /t4S1uvoHD7a3d72eQ9SZ05FQRrPInFXwS03GBRH63NeWxDgiWftQtscu+myUAayHm5A
         AE5eJ8DFC31wtWGEv74XBH4JhDTRQhWrCrWpwIer5jDHgsyhSOzLC97angKnvurgRoIN
         ErXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758764804; x=1759369604;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=85fJuIkIL0zFa5NAmKr1mvE2dYhK1JVFush8sn/+tyk=;
        b=n/WRXgObEnietOHS8cijhM5e+oSOl7K3x4BDMVEOm3YpFqYf1yZqYhD1p/lhGMiEUC
         ixd6M3VKnWTJ2TJVoWU00WRgjgmO7zoqlM7wci/+4/ScQZUkRwL8QtPAr0/NokiwgUcm
         nPUZKNyKK8Awn0jpSJE+V7Iex++FXUfjH9DY9131x8MnEgLp3sO80glzZqjTuFbE4BTO
         t4/faFHt5I57bS4toBoquv5Wct8dnfIMWzExjne7EQo9f4fxZ0spwpjem3HPFOSxQssQ
         v/1tIinqayxShNqu0X+iVT/w44nVSDobmckk6BCK391H9Y9Wr1NQ/nXCNDns8N3fTOBF
         ywnw==
X-Forwarded-Encrypted: i=1; AJvYcCXwoEcsRpoijum0WfZDvJ5MlwO8FrX3fkvIin5gGITxMvWxSp7I87Sc0ezdSv5Z4RWWgQZ41waZnmM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaXvFfzNV1696Ho6/oX+vQMxYEL73V+Ava1aggmBDH/jGq0KRQ
	3Ss+fVw5Xyr5I7KCcqAzpZM0f60ZvkMkOfuHKt1+vyndL4Ed4cY8FIv7FUdHJ2iyE5L2LFo3s+F
	zIvLnUgcI7CoVBIUKgBsOyBE5GToH3vc=
X-Gm-Gg: ASbGnct7soLcM9QOH7YxPqW2oK/u9Zl6LoI/Yu1ljcKmoSo+B+QUWLfunQXwdYspcTT
	DiMyT3ebgSXcrRJrL6lXbI1PFaob0U40oxzKrAXCVOD7Oe/POYhx/LZst8c4dfMjMHBUh1oOawN
	M6LU5OALkZZljRW2rGJJzlcMpIU1pIg+rhSIijyTtoGXHW9aU9Jo7cKsEHiRyVnBYqvtV7D2v7E
	9ERhH1fMzugNBoBk20rU3UnLHzNAQJkzAy+
X-Google-Smtp-Source: AGHT+IH4AchlDsowYYE+w4wzPJn03yQRQb4BMfQMSzOsS136u1OryTmFlDQB0qJjJ3owJ2eL4O9lMggxOrUiKuT9Azo=
X-Received: by 2002:a17:903:264b:b0:269:8059:83ab with SMTP id
 d9443c01a7336-27ed4ab545emr10812965ad.51.1758764803975; Wed, 24 Sep 2025
 18:46:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250924-knp-usb-v1-0-48bf9fbcc546@oss.qualcomm.com> <20250924-knp-usb-v1-2-48bf9fbcc546@oss.qualcomm.com>
In-Reply-To: <20250924-knp-usb-v1-2-48bf9fbcc546@oss.qualcomm.com>
From: =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski.k@gmail.com>
Date: Thu, 25 Sep 2025 10:46:32 +0900
X-Gm-Features: AS18NWB9OdekwkAK17ia2naP3ZlyoDmiLGmgYBkC9bH8Iatmiq7IbsVkxyDb_Qc
Message-ID: <CAJKOXPfVhixCk0_Xh=9XokjHObM=P+SP=itaXHv7xTr69pc3_Q@mail.gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: phy: qcom,m31-eusb2-phy: Document M31
 eUSB2 PHY for Kaanapali
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, aiqun.yu@oss.qualcomm.com, 
	tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com, 
	yijie.yang@oss.qualcomm.com, 
	Ronak Vijay Raheja <ronak.raheja@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 25 Sept 2025 at 08:35, Jingyi Wang <jingyi.wang@oss.qualcomm.com> wrote:

>  Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
> index c84c62d0e8cb..ab1cdedac05c 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
> @@ -15,7 +15,11 @@ description:
>
>  properties:
>    compatible:
> -    items:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - qcom,kaanapali-m31-eusb2-phy
> +          - const: qcom,sm8750-m31-eusb2-phy

This time maybe without HTML:

There's no such code AFAIK, because original work was never resent and
never merged

You create some convoluted big dependency chain and I suggest first to
finish upstreaming previous project, because otherwise it's difficult
to review and impossible to apply.

