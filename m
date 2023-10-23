Return-Path: <linux-usb+bounces-2087-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7A37D3F34
	for <lists+linux-usb@lfdr.de>; Mon, 23 Oct 2023 20:24:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E18F11C20921
	for <lists+linux-usb@lfdr.de>; Mon, 23 Oct 2023 18:24:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 491722137F;
	Mon, 23 Oct 2023 18:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="daqprl+U"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377AD1B278
	for <linux-usb@vger.kernel.org>; Mon, 23 Oct 2023 18:24:39 +0000 (UTC)
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 102C810D
	for <linux-usb@vger.kernel.org>; Mon, 23 Oct 2023 11:24:36 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2c518a1d83fso56956971fa.3
        for <linux-usb@vger.kernel.org>; Mon, 23 Oct 2023 11:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698085474; x=1698690274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AXl7QD45QL6sivgQCN1vZsJFBc1tqDJMcsR0n1+9ZVA=;
        b=daqprl+U42OIBvQ5tXF0x+KPqTr+l5gKICMowLVqUpwU46UPt8Z0LnPxG/oQyotROh
         dXe1tdEyP2r5DMaevupFfO+QGEXaKNRlbUblqufFy4cSEKrP38LLr6CfKnojvdypjViK
         mb4M0SYFap7nYZ6vWQhZpcGjmoIN1X1efL8DHbp7ndN/IAdX6T/Wn/4Dt5B754cQr0Dy
         RdaXeUBbCAqDcaZDyFS7OmaFOX1Bgwm4NsI7ELsezLWhG4xhoH/ouclw2+lwUZ58DHG4
         GAH4JolxLxhjaC322Z5a/2mB9vl7iQFzKFZ8R3+NDnPq6DmZSz5AKkcJJUWXWIC2+9Lz
         5aaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698085474; x=1698690274;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AXl7QD45QL6sivgQCN1vZsJFBc1tqDJMcsR0n1+9ZVA=;
        b=EB1gUuFCGvWg/8wqoYKHnVWQtS3ns9+NkVvthMztc/hF5548VVFAlWWJx0gK00O296
         eUhd3kbZ+CiQVeYfSaN2tLBfC12akz/08vqOdcg43CpZrkUA2QRrUDw9FgDNZI0JsL1r
         ez1/3KD02+3FbzZUBp1q1z2GWhz6y2OUNc4CLMCWftvvGVBWOdIeReLxsFqLXFEQJeDo
         6+9kJVVvglq2WDagdzb9WJ1/a8Q8xzYdawtdq1ch8SFEPB//bSk+9YmLPP8cXB8CawFV
         UDrh9cuj2UKPlWNwwdKL8K6xUtZIPd9NVMwRey38S0oX/oVvq+KQFNi4tAi/kBXPwGnW
         qATA==
X-Gm-Message-State: AOJu0Yw8n6wxQkuiHXUCST5W1pATdCLmYBzxNOX4ZD8jeRCK5UK1QKfs
	2kIZpK0+wqdr5YAFArrTW32biw==
X-Google-Smtp-Source: AGHT+IHkBgeiF76Bx8knzqTGYbXJFudDOPHcgula2SENkD2657KkYSAFEtuZJ/OAVh+6CzJaf2DBDA==
X-Received: by 2002:ac2:5456:0:b0:507:b074:ecd4 with SMTP id d22-20020ac25456000000b00507b074ecd4mr6516885lfn.7.1698085474021;
        Mon, 23 Oct 2023 11:24:34 -0700 (PDT)
Received: from [127.0.0.1] (85-76-147-63-nat.elisa-mobile.fi. [85.76.147.63])
        by smtp.gmail.com with ESMTPSA id z19-20020a19f713000000b00507a3b16d29sm1785836lfe.191.2023.10.23.11.24.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Oct 2023 11:24:33 -0700 (PDT)
Date: Mon, 23 Oct 2023 21:24:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>, Janne Grunau <j@jannau.net>,
 Simon Ser <contact@emersion.fr>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 freedreno@lists.freedesktop.org
Subject: Re: [RFC PATCH v1 12/12] usb: typec: qcom: define the bridge's path
User-Agent: K-9 Mail for Android
In-Reply-To: <ZQRKq7K8jKlH/Y4X@kuha.fi.intel.com>
References: <20230903214150.2877023-1-dmitry.baryshkov@linaro.org> <20230903214150.2877023-13-dmitry.baryshkov@linaro.org> <ZQRKq7K8jKlH/Y4X@kuha.fi.intel.com>
Message-ID: <0F1BE090-92C4-4233-A77A-9B4C653DA1A7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 15 September 2023 15:14:35 EEST, Heikki Krogerus <heikki=2Ekrogerus@linu=
x=2Eintel=2Ecom> wrote:
>Hi Dmitry,
>
>On Mon, Sep 04, 2023 at 12:41:50AM +0300, Dmitry Baryshkov wrote:
>> In order to notify the userspace about the DRM connector's USB-C port,
>> export the corresponding port's name as the bridge's path field=2E
>>=20
>> Signed-off-by: Dmitry Baryshkov <dmitry=2Ebaryshkov@linaro=2Eorg>
>> ---
>>  drivers/usb/typec/tcpm/qcom/qcom_pmic_typec=2Ec     | 11 +++++++----
>>  drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_drm=2Ec |  4 +++-
>>  drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_drm=2Eh |  6 ++++--
>>  3 files changed, 14 insertions(+), 7 deletions(-)
>>=20
>> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec=2Ec b/drivers/=
usb/typec/tcpm/qcom/qcom_pmic_typec=2Ec
>> index b9d4856101c7=2E=2E452dc6437861 100644
>> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec=2Ec
>> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec=2Ec
>> @@ -156,6 +156,7 @@ static int qcom_pmic_typec_probe(struct platform_de=
vice *pdev)
>>  	struct device_node *np =3D dev->of_node;
>>  	const struct pmic_typec_resources *res;
>>  	struct regmap *regmap;
>> +	char *tcpm_name;
>>  	u32 base[2];
>>  	int ret;
>> =20
>> @@ -211,10 +212,6 @@ static int qcom_pmic_typec_probe(struct platform_d=
evice *pdev)
>>  	mutex_init(&tcpm->lock);
>>  	platform_set_drvdata(pdev, tcpm);
>> =20
>> -	tcpm->pmic_typec_drm =3D qcom_pmic_typec_init_drm(dev);
>> -	if (IS_ERR(tcpm->pmic_typec_drm))
>> -		return PTR_ERR(tcpm->pmic_typec_drm);
>> -
>>  	tcpm->tcpc=2Efwnode =3D device_get_named_child_node(tcpm->dev, "conne=
ctor");
>>  	if (!tcpm->tcpc=2Efwnode)
>>  		return -EINVAL;
>> @@ -225,6 +222,12 @@ static int qcom_pmic_typec_probe(struct platform_d=
evice *pdev)
>>  		goto fwnode_remove;
>>  	}
>> =20
>> +	tcpm_name =3D tcpm_port_get_name(tcpm->tcpm_port);
>> +	tcpm->pmic_typec_drm =3D qcom_pmic_typec_init_drm(dev, tcpm_name);
>
>So I got some questions and concerns off-list=2E This was one of the
>concerns=2E That tcpm_name is now the actual port device name, so I'm
>afraid this is not acceptable=2E
>
>You can't use device name as a reference, ever=2E There is no way to
>guarantee that a device with a specific name is what you meant it to
>be by the time it's accessed=2E

Hmm, could you please be more specific, why? I mean, class devices are not=
 that easy to be renamed in sysfs, are they? Or are you concerned about the=
 device being destroyed behind userspace's back? At least for MSM this will=
 be a huge problem already, with the bridge driver suddenly being removed=
=2E

>
>If you need to deal with a device, then you have to get an actual
>reference to it (class_find_device_by_fwnode() should work in this
>case)=2E
>
>Ideally you would get the reference in the place where you actually
>use it (so drm_connector=2Ec or more likely drm_sysfs=2Ec) but that would
>mean a dependency on typec in there, if the component framework or
>something like that (device links?) is not an option=2E You could of
>course try to confine the dependency somehow=2E drm_class does not have
>implementation for dev_uevent, so you could take over that as a
>temporary solution=2E
>
>The only way to avoid the dependency completely would be to pass that
>device reference from here through your drm bridge chain somehow=2E
>But that's also really fragile=2E But it could be acceptable as a
>temporary solution perhaps, if it's even possible=2E
>
>Br,
>


