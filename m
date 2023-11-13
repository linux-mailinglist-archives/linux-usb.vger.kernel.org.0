Return-Path: <linux-usb+bounces-2834-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4046F7EA0EB
	for <lists+linux-usb@lfdr.de>; Mon, 13 Nov 2023 17:08:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 718E31C2097B
	for <lists+linux-usb@lfdr.de>; Mon, 13 Nov 2023 16:08:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DC7D219FC;
	Mon, 13 Nov 2023 16:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S8wS8HR2"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8145921A13
	for <linux-usb@vger.kernel.org>; Mon, 13 Nov 2023 16:07:52 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3615910FB
	for <linux-usb@vger.kernel.org>; Mon, 13 Nov 2023 08:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699891669;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pAkyWuAlP3WRAhkP+++lmx+mwvKY3DtmoscUolCQlDI=;
	b=S8wS8HR28knBtVFcSPiGXyREKrrMviYRASH4lIe+6B4CnaG4WGtk1JWuXFy+59BxIhYyBQ
	U+8E9U5S9Cn0hjNGwNHYMjQ7mTcsw+x/DQ/TJ2eiKHnk775CTPhTlbEAlCgp18gNyJEggg
	C/5ITgjV89reE3utK23i0WoqgreZ4Tw=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-674-vRhUp1pOOmyS09kq02cxKQ-1; Mon, 13 Nov 2023 11:07:47 -0500
X-MC-Unique: vRhUp1pOOmyS09kq02cxKQ-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-9dd489c98e7so321660366b.2
        for <linux-usb@vger.kernel.org>; Mon, 13 Nov 2023 08:07:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699891666; x=1700496466;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pAkyWuAlP3WRAhkP+++lmx+mwvKY3DtmoscUolCQlDI=;
        b=NNcXQreV0lYsvPsXbwjiYA1+GDewteGRzfQL+p7XGC7o0QMqR43mukECy2fuVio+K/
         hrGMtKdS9k1QxtCRvPWW68gtZ34G3vdsDvuEKXXSHC0yEyCjL43qK+T6q58+Abk8vAk8
         P1fnAnpXddKs9radb9eZbvc6By/e9O6KO6UbMoI0WnVmE1PXww5r3aZKP2MsXPG7dGnY
         0VvS7OvF1608IzRGARtCyP1vY89W8zSRpw5luLI1pZoRckLOI8tdDhV0xB0UXt1yK4Wf
         DPpn5/KCmAHcB0B3JO6nV0msMJxSDVkna4e1to8e7J/3epM7pTwKQ3f8Ivk/3s4F3pws
         6KRw==
X-Gm-Message-State: AOJu0YyfF7njpgIo9gQGpyNxN9taRpVFGZHZxkbRdZpgBeEaIkUng5J3
	q0pfNEhKTU5dstxysO/GJ1EElU+LA2aAHAJLV+56BxENPuCnI1FkOJLutoCGTpcLGBg/Q3+XdOW
	hOlOqCBaowLregarTAsrz
X-Received: by 2002:a17:906:b1b:b0:9ae:5370:81d5 with SMTP id u27-20020a1709060b1b00b009ae537081d5mr4359535ejg.41.1699891666725;
        Mon, 13 Nov 2023 08:07:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEGTihF/62EKU+Wtiz2v06QtymYDdd3hPfvECCV8zFTiBRYk2GSvIbvrQVO+5wZ5S1Ntj5ooA==
X-Received: by 2002:a17:906:b1b:b0:9ae:5370:81d5 with SMTP id u27-20020a1709060b1b00b009ae537081d5mr4359512ejg.41.1699891666435;
        Mon, 13 Nov 2023 08:07:46 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id um27-20020a170906cf9b00b009de467a25d5sm4272281ejb.13.2023.11.13.08.07.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Nov 2023 08:07:45 -0800 (PST)
Message-ID: <ae5131e3-b282-437d-9a80-ae8b697eea3c@redhat.com>
Date: Mon, 13 Nov 2023 17:07:44 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] dt-bindings: connector: usb: provide bindings for
 altmodes
Content-Language: en-US, nl
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Mark Gross <markgross@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20231113145328.42575-1-dmitry.baryshkov@linaro.org>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231113145328.42575-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Dmitry,

On 11/13/23 15:33, Dmitry Baryshkov wrote:
> In some cases we need a way to specify USB-C AltModes that can be
> supportd on the particular USB-C connector. For example, x86 INT33FE
> driver does this by populating fwnode properties internally. For the
> Qualcomm Robotics RB5 platform (and several similar devices which use
> Qualcomm PMIC TCPM) we have to put this information to the DT.
> 
> Provide the DT bindings for this kind of information and while we are at
> it, change svid property to be 16-bit unsigned integer instead of a
> simple u32.

Thank you for your patches. I'm fine with this, one remark though:

Since at least the existing arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
is already using this I'm not sure of changing the svid property to
an u16 is really a good idea from devicetree compatibility pov ?

Also the whole 16 bit property notation in the dts files seems
less readable to me. So to me this seems more of something
which one would use when having a significantly sized array
of u16-s since then it will result in space-saving in the dtb.

In this case I personally think it is fine to leave this
as an u32.

With all that said, I'm fine either way.

Here is my ack for routing the drivers/platform/x86/intel/chtwc_int33fe.c
bits through whatever tree is best to get this upstream:

Acked-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans




> Dmitry Baryshkov (3):
>   dt-bindings: connector: usb: add altmodes description
>   usb: typec: change altmode SVID to u16 entry
>   arm64: dts: qcom: qrb5165-rb5: use u16 for DP altmode svid
> 
>  .../bindings/connector/usb-connector.yaml     | 35 +++++++++++++++++++
>  arch/arm64/boot/dts/qcom/qrb5165-rb5.dts      |  2 +-
>  drivers/platform/x86/intel/chtwc_int33fe.c    |  2 +-
>  drivers/usb/typec/class.c                     |  5 +--
>  4 files changed, 40 insertions(+), 4 deletions(-)
> 


