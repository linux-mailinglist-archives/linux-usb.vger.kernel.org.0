Return-Path: <linux-usb+bounces-5682-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C37843845
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jan 2024 08:50:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8FAED289BE2
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jan 2024 07:50:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE0A85645E;
	Wed, 31 Jan 2024 07:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F1+XAaSN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD8154FB8
	for <linux-usb@vger.kernel.org>; Wed, 31 Jan 2024 07:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706687428; cv=none; b=bTjfFMZAhRP4sCgxDUkBmTyL1mat50sBpiqzrZDrOQydF3OlKt/ADqxWjo5G3A6Jt05CF1NmxZRPKqMQ4bakUCuiGVrWW0XIEAh6IN55RLbB4k4Z8748MrXgdgazrWRlv/NYmy4m4R5WwevSblJpgt5MFLi1jP+jnWQVpbziQxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706687428; c=relaxed/simple;
	bh=r5f+eKQw4GNA+XYqaoijjgLbi6p2iB5TMitfiFcKlkY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XUFEqU8b9uTB0y60qh07aO72N+S4UwTUqcabf8uuC3TD5bWdTkxcpRWHxjRSyqrCndojyHp7BYg7SkbPt+r7oUCG54N298Dat3gOfGJ1c547SAWec/AQzEHIszuKyf8vlKgXiXN0PDQA13IMU69OM3wJQCD3+mvBm9b5Qf0Gl34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F1+XAaSN; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-dc6b7df1169so540872276.0
        for <linux-usb@vger.kernel.org>; Tue, 30 Jan 2024 23:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706687424; x=1707292224; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9Uc6sJE6X8wbDnNtNigQI7DlbxjVsgaZ7vwLQgmQngE=;
        b=F1+XAaSNygrGYUBoe29OIhKL8S252JQTUpexoOHc+ZfNAIwV2nQRGEHXn9dBPLbHTE
         mN+MlRNI6e1xEQJd33Fkqm7/lIERJo3jeFKgjKTURFIuYBIMmbOGzYLi8GUdzfvlGi9D
         2TR2Pb23hVu86pVlmAV4WU6xeL+tZVhS/vXFEJXzvRyqTzcaCPED/GW7Yr3dHJr7AQ2e
         h8rfNxhGxqzyzBQdHukSovtvvq6XMUcXPYNUR2aeqXtMbDdnIVdwmbqel1TSgaWxObK2
         wV0SLUw0rkV0zbuE1wfkknTk8fBFnjlb7nam5Y/UDukbpxyOZcvjIYyiXvludaO9HsWN
         IukQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706687424; x=1707292224;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Uc6sJE6X8wbDnNtNigQI7DlbxjVsgaZ7vwLQgmQngE=;
        b=BtinvFkN0NbZYAFXNiWIFUuzsMGHEK/VBDKZl4L5wPc5AeG9cGsixFbCBxgYRsIr2x
         M61jtHuhLTo1GZkOnazR7Qufw5wLq73jMDuGnLrGo0hSJ6+fPywUTxBnVrfGQFJc36ZN
         N7oVw2NQC7hbAAM/W4t1suAGbS1EN9lqO/peTzgPmn818XcgSo5RJWNaO/gHGbzfa584
         RhTUppOIks4UEk6n+JGzfz2S8M5/qwArGpaSzqCpVCXokgCr9AN4gmISBVpQKpuz9/HL
         MlvrZ6AJbaMp1xotPbK3jA2sJ72qP+NcU7op1bhIT0yItDVPlTH9HoFCERZW6hH7kbyU
         2nPA==
X-Gm-Message-State: AOJu0YwBRjbiJ7Ze1+KGSkAQeA6DN75sddiLsgAlLzIzsXkgHEPtNpgf
	g/qp+rTcPp2wuLZBqiBK8wBWf9bd2KuhJcbTbmwhednRa+S4f/C5A1U0z3eILkPKxEjLE6KHm0G
	jCJbBoC+NJnqqhSRR3701b2MFEB1kdu/AXgBtoA==
X-Google-Smtp-Source: AGHT+IF7TMdOx5sb7/1aYKit5X87Fywgwj5txjLUi65QUvyZ5/IO61o+4XW9nVX3Zdjdm14K2Js748kOfrGGHTnASVI=
X-Received: by 2002:a25:cec7:0:b0:dc6:af04:2e05 with SMTP id
 x190-20020a25cec7000000b00dc6af042e05mr929820ybe.7.1706687424379; Tue, 30 Jan
 2024 23:50:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240130-pmi632-typec-v3-0-b05fe44f0a51@linaro.org> <CYSQ686XZSA7.1SVD3Z9SR1BH1@fairphone.com>
In-Reply-To: <CYSQ686XZSA7.1SVD3Z9SR1BH1@fairphone.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 31 Jan 2024 09:50:13 +0200
Message-ID: <CAA8EJpq6rH53=Cd5y-RmFohbzoEu45Gu==C6DEBq=_=zNwEt3Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] usb: typec: qcom-pmic-typec: enable support for
 PMI632 PMIC
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guenter Roeck <linux@roeck-us.net>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-usb@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 31 Jan 2024 at 09:49, Luca Weiss <luca.weiss@fairphone.com> wrote:
>
> On Tue Jan 30, 2024 at 8:32 PM CET, Dmitry Baryshkov wrote:
> > The Qualcomm PMI632 PMIC (found on Qualcomm Robotics RB2 platform)
> > doesn't support USB Power Delivery. However this PMIC still supports
> > handling of the Type-C port (orientation detection, etc). Reuse exiting
> > qcom-pmic-typec driver to support Type-C related functionality of this
> > PMIC. Use this to enable USB-C connector support on the RB2 platform.
>
> Hi Dmitry,
>
> In case you send a new revision you can drop my Tested-by on the RB2
> patches since it's a different platform, and the tag on the dt-bindings
> patches also don't make too much sense I think?

Ack, I will. But I hope there will be no next revision.

>
> Thanks!
>
> Regards
> Luca
>
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> > Changes in v3:
> > - Added constraints to qcom,pmic-typec / reg property (Krzysztof)
> > - Dropped merged TCPM and Qualcomm PHY patches
> > - Link to v2: https://lore.kernel.org/r/20240113-pmi632-typec-v2-0-182d9aa0a5b3@linaro.org
> >
> > Changes in v2:
> > - Split qcom_pmic_typec_pdphy_set_roles() changes to separate patch
> >   (Konrad)
> > - Simplified devm_kzalloc / sizeof() argument (Konrad)
> > - Made start / stop callbacks mandatory (Bryan)
> > - Reworked Type-C port handling into a backend similar to PD PHY (Bryan)
> > - Made more qcom-pmic-typec data static const (Bryan)
> > - Squashed usbc PHY single-lane removal patch (Konrad)
> > - Further usbc PHY cleanup (Konrad)
> > - Fixed order of DT properties in pmi632.dtsi (Konrad)
> > - Instead of specifying bogus PDOs for the port, specify pd-disable and
> >   typec-power-opmode properties for the connector
> > - Moved orientation-switch / usb-dual-role properties to sm6115.dtsi
> >   (Konrad)
> > - Linked usb_dwc3_ss and usb_qmpphy_usb_ss_in
> > - Link to v1: https://lore.kernel.org/r/20240113-pmi632-typec-v1-0-de7dfd459353@linaro.org
> >
> > ---
> > Dmitry Baryshkov (5):
> >       dt-bindings: regulator: qcom,usb-vbus-regulator: add support for PMI632
> >       dt-bindings: usb: qcom,pmic-typec: add support for the PMI632 block
> >       usb: typec: qcom-pmic-typec: add support for PMI632 PMIC
> >       arm64: dts: qcom: pmi632: define USB-C related blocks
> >       arm64: dts: qcom: qrb4210-rb2: enable USB-C port handling
> >
> > Vladimir Zapolskiy (1):
> >       arm64: dts: qcom: sm6115: drop pipe clock selection
> >
> >  .../regulator/qcom,usb-vbus-regulator.yaml         |  9 ++-
> >  .../devicetree/bindings/usb/qcom,pmic-typec.yaml   | 32 ++++++++-
> >  arch/arm64/boot/dts/qcom/pmi632.dtsi               | 30 ++++++++
> >  arch/arm64/boot/dts/qcom/qrb4210-rb2.dts           | 50 +++++++++++++-
> >  arch/arm64/boot/dts/qcom/sm6115.dtsi               | 44 +++++++++++-
> >  drivers/usb/typec/tcpm/qcom/Makefile               |  3 +-
> >  drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c      | 30 ++++++--
> >  .../usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.h    |  2 +
> >  .../typec/tcpm/qcom/qcom_pmic_typec_pdphy_stub.c   | 80 ++++++++++++++++++++++
> >  9 files changed, 266 insertions(+), 14 deletions(-)
> > ---
> > base-commit: 41d66f96d0f15a0a2ad6fa2208f6bac1a66cbd52
> > change-id: 20240112-pmi632-typec-4c7533092387
> >
> > Best regards,
>


-- 
With best wishes
Dmitry

