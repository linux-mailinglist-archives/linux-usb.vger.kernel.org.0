Return-Path: <linux-usb+bounces-25097-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9204AE8235
	for <lists+linux-usb@lfdr.de>; Wed, 25 Jun 2025 13:59:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0FBA3A8637
	for <lists+linux-usb@lfdr.de>; Wed, 25 Jun 2025 11:57:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E87C262FCC;
	Wed, 25 Jun 2025 11:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="qs5YSOO0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C33262FC0
	for <linux-usb@vger.kernel.org>; Wed, 25 Jun 2025 11:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750852530; cv=none; b=OrfYMMzbp+JyfvJNrP/LO8EOjE3Yc+XXp5JMPkJiv0UmHLbMhY+J+D1tPEiA60/ttSkwOAJ60twJ4gtDYdWTCVkZ9mfs9Pc1h7zbAfDIq3DYIyoAYzcXs2ytlyrckXtXiod801uMl4x45+3EtKtdY5nIt0B9BuOXRBz7q8GWRwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750852530; c=relaxed/simple;
	bh=Ele4kC/bFjkVABuTlMtPoVal/q9sn4Mx7Xjke1CK0u4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=gUgcIe7SaHTJhzt+t7zUp+oPxT7R5WQAnvLblG+h3VknkA/1DX9Q2fNaO+zGD5yw4UPDugXll3euvcvchShwqizUsgWroqMnFybt9zDG16YBHLGin2PpoRUdaWHwqpZ2qUwL8lbApO+VUVNryIUjKp59CtuN7LSAPubjZLqZcdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=qs5YSOO0; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ad89c32a7b5so270812966b.2
        for <linux-usb@vger.kernel.org>; Wed, 25 Jun 2025 04:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750852526; x=1751457326; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ele4kC/bFjkVABuTlMtPoVal/q9sn4Mx7Xjke1CK0u4=;
        b=qs5YSOO0LLGQ3vi6rgHcweeS/ep1QgOkxBFP9k0ma2vtkXALRY3UA/PIvNQtFlCrgA
         +s597SFYgiVvq1zi+seQXmRMiQO/JC+kKqEKG5wONMcnjRl3w9F6Ot6VqXM6x/DDuFl/
         5N8IETSyMMYnbOSnO1rkJTyc2c/5W4dYFJx/6uu+ceGGpeHa66CgYZ/19MZnGegDcs6y
         Rr6ijT6wXL4nzef8MaP0nEGRBsG0dINE5pQRZ8Exz4pnfgNKAY4isZbTtXAfeMPm3KXD
         P3ESbmKN04yIlKkbzpmFSNyGEWv+l36Z6YQaYn/EP9iZlmB+2wjs0XFhEmB8o95IvsPI
         6PAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750852526; x=1751457326;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ele4kC/bFjkVABuTlMtPoVal/q9sn4Mx7Xjke1CK0u4=;
        b=uBa8+YhgOKaq4Q91X6np19EujEsMeOmsBUuXsEqog9LpF2TPvikTSx9t8Drthg4ASE
         EnjmFgtAmSPxGgzPIdpia4gXHIPFa/Ub0xux0vBt1/1Fyvw4AqbeGuJXjmvEndbbN6Ui
         WGvO/a3PTOUEORyF1+EYVxXy3f9r4ImoEhkq4zqqjz9mRDvIpXQNartUnr3IbLM5TWR0
         SbYgPdrEUZqsKKjRmacSssZYmRcn+5MPMEMHXDqYCGinKjDRcO+thQ5ROMYj+R86jR5Q
         Ytabevjs+avWZ758bnvGDoAWyhJZoLDxSnUPZuJTnXfgSYalmBzvBnQ/EmxHJZWdxkAr
         UvGA==
X-Forwarded-Encrypted: i=1; AJvYcCUy26PXinZJBbl2tBNPW4znie2Jjluc+vp/dBy0/SrZo0wz96DD8D68cedTdCApCqpKF9xPe08FkYI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZILffN/3jrcZf8gKC4w8kTZVWJgncBA/3IXzAX4oCJYsbE0zx
	0yXKhk/0ho7A7Qnw1oTeoRmQgMrYuDE4fnrDl9Gvj9a+oGAQtzR4bx+akxxSEINyLZo=
X-Gm-Gg: ASbGncsaFRgHM3twFh/iCDQ1BijDQll8cadZBY3uzgut4C81PfVxn4OafbIyIH/dyAT
	MeJ6jFU1sotAad6OZmUhEHaY8CQMEpuScJ2IovjLjuTTlDRhs/NQIquNLcDAhMzi7c+7gBFzslD
	uatVNITX+TRVx4aOJpEe+DwsxIa2BNxyHMdelSgewPmKKOgx1ZHkv2auJPjtuwTN0lPti/fT6op
	irJCOUWg+i2AknDEvMTrvL6iKIN/dtjEDiPFyHlLMpP4QzMZ/C6Vxb22L2VWkBbmdRHyAKx1XY5
	gtZNsYgIA5WrdbxCphuY8qIpqWFZ5SpZ5AAG+lREVlhmYLI9Eov3In2NcH8wHbMUzY720S25yha
	EIA+NpOGjY0kq4rUyjUY7rC32WU2+2UM=
X-Google-Smtp-Source: AGHT+IGHwtU2WcLOLeMlMlhviB+W5ro/PgSmY8OoYgsUjPuqlDw7Eu44hCDzY1aMqXqaPDEZvGOrnQ==
X-Received: by 2002:a17:906:d92:b0:adb:4917:3c10 with SMTP id a640c23a62f3a-ae0befc3ac1mr209592966b.60.1750852525989;
        Wed, 25 Jun 2025 04:55:25 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0cb358618sm29256266b.102.2025.06.25.04.55.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 04:55:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Jun 2025 13:55:24 +0200
Message-Id: <DAVLF5WB0IZU.3EZCARZSQO050@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-usb@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-phy@lists.infradead.org>
Subject: Re: [PATCH 3/4] phy: qcom: phy-qcom-snps-eusb2: Add missing write
 from init sequence
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Wesley Cheng" <quic_wcheng@quicinc.com>, "Vinod Koul" <vkoul@kernel.org>,
 "Kishon Vijay Abraham I" <kishon@kernel.org>, "Abel Vesa"
 <abel.vesa@linaro.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250625-sm7635-eusb-phy-v1-0-94d76e0667c1@fairphone.com>
 <20250625-sm7635-eusb-phy-v1-3-94d76e0667c1@fairphone.com>
 <4d215791-35da-4139-9cc8-33da5d46469e@oss.qualcomm.com>
In-Reply-To: <4d215791-35da-4139-9cc8-33da5d46469e@oss.qualcomm.com>

On Wed Jun 25, 2025 at 1:51 PM CEST, Konrad Dybcio wrote:
> On 6/25/25 11:14 AM, Luca Weiss wrote:
>> As per a commit from Qualcomm's downstream 6.1 kernel[0], the init
>> sequence is missing writing 0x00 to USB_PHY_CFG0 at the end, as per the
>> 'latest' HPG revision (as of November 2023).
>>=20
>> [0] https://git.codelinaro.org/clo/la/kernel/qcom/-/commit/b77774a89e3fd=
a3246e09dd39e16e2ab43cd1329
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>
> Both the original and your commit messages are slightly misleading, the
> HPG (and the code which is indeed in sync with it after the change is
> made) only sets the value of 0 to BIT(1), a.k.a. CMN_CTRL_OVERRIDE_EN.
> You most definitely don't want to set the entire register to 0.

After reading your message twice I think I've got it.

Code is correct, but commit message is wrong (it's saying writing 0x00
but it's not actually doing this in the code, just setting the bit to 0).

>
> With that fixed:
>
> Fixes: 80090810f5d3 ("phy: qcom: Add QCOM SNPS eUSB2 driver")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Thanks for taking a look!

Regards
Luca

>
> Konrad


