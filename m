Return-Path: <linux-usb+bounces-2848-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4F57EA5C8
	for <lists+linux-usb@lfdr.de>; Mon, 13 Nov 2023 23:13:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 315FC280F85
	for <lists+linux-usb@lfdr.de>; Mon, 13 Nov 2023 22:13:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1BC82E625;
	Mon, 13 Nov 2023 22:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DC0HdELW"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27862D63C
	for <linux-usb@vger.kernel.org>; Mon, 13 Nov 2023 22:13:36 +0000 (UTC)
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F13BD57
	for <linux-usb@vger.kernel.org>; Mon, 13 Nov 2023 14:13:34 -0800 (PST)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-5a90d6ab962so57746937b3.2
        for <linux-usb@vger.kernel.org>; Mon, 13 Nov 2023 14:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699913614; x=1700518414; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TgVRhaibRPEV0BOmS0W5kCOcsP7nac0xFB7b24z8+LQ=;
        b=DC0HdELWzaHoZIbjY2Vf7VXOaMGVmT3mUPpScvERhqlK3HCb4S/zRm/0hrvaBBeXVV
         7M/MYYHVGwk6bVGH0tcyNEv7j9KxDdtJyUgz4kU9WSg2Zp8z78hBMeEqUFC/kJpOyuaK
         tqTUMvfmLumR38nBYpSUsf+lDzte2G3jgqqd8GI56R44yiSbvHH4WLz5KT+vBSjkZRPL
         v7dBlX7bAPbbw3daKM0U8vZfV0/+c0JEcoZMzl1b15Yvahxfbgkl+QMAEN1mbqFIGx9W
         GU1lzBMaMwtj/4fWC5rtCuITfDb4RFm3EJO6SKfD5+O4tfiqN1u0A2r9FO9IH2TmDVlt
         KSEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699913614; x=1700518414;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TgVRhaibRPEV0BOmS0W5kCOcsP7nac0xFB7b24z8+LQ=;
        b=lyhENX9mnwLKAiy7PqdWy1WtoSI/Hay18d7mquu8leCdLdsRataQQ+yv5kEwZBJ9xC
         omawzaxsXTIldTuCLF46xCkujrCl+iq6cBYaTAQDl6LmE0pnrZ3AWYW1DwQmcpTKew/j
         eC/3mjMl9SEZfKRaThch9Td5ecVxw709jtD5GcTF++9bkO2p7nJ0LlXHgfPGGGk7C2/f
         ppH6Nqd5h2+3ITWWMA0zQLek/JXndLzWGkrXQ9iMvt3h7jOufaH/XTYx/ZI8UorRXwkX
         O6IPw0FWCNzKYXLeojPpcOxDjKxXx+Y5jWNqqwqitc2XfZAMpjQvooG6PrfCP62n+oQY
         AmIQ==
X-Gm-Message-State: AOJu0YwwXIREQRmlro4iYuFTYF7Qx4Qhx84fbprHsQ+5ZCpJe0GOSyTu
	03Z8tuc4ILpPlDjTK9OB5BtFthsgFkz/VzriMt4QM2hTzW8sTFYh
X-Google-Smtp-Source: AGHT+IG7qkUFziC8v6lSPZLAQbseeUt0nHP5c186LxLXAlJLmZiYs47nkq3/qgS/GQ+URO+W9mOD4Euhn0tPdJbyymM=
X-Received: by 2002:a0d:eb4e:0:b0:59f:9c08:8f12 with SMTP id
 u75-20020a0deb4e000000b0059f9c088f12mr8888321ywe.38.1699913613750; Mon, 13
 Nov 2023 14:13:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231113145328.42575-1-dmitry.baryshkov@linaro.org> <ae5131e3-b282-437d-9a80-ae8b697eea3c@redhat.com>
In-Reply-To: <ae5131e3-b282-437d-9a80-ae8b697eea3c@redhat.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 14 Nov 2023 00:13:22 +0200
Message-ID: <CAA8EJpq_vXefsNHmUCopmyATF8=PsjG0-EwJCY65yfvkCK+A4w@mail.gmail.com>
Subject: Re: [PATCH 0/3] dt-bindings: connector: usb: provide bindings for altmodes
To: Hans de Goede <hdegoede@redhat.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Mark Gross <markgross@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 13 Nov 2023 at 18:07, Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi Dmitry,
>
> On 11/13/23 15:33, Dmitry Baryshkov wrote:
> > In some cases we need a way to specify USB-C AltModes that can be
> > supportd on the particular USB-C connector. For example, x86 INT33FE
> > driver does this by populating fwnode properties internally. For the
> > Qualcomm Robotics RB5 platform (and several similar devices which use
> > Qualcomm PMIC TCPM) we have to put this information to the DT.
> >
> > Provide the DT bindings for this kind of information and while we are at
> > it, change svid property to be 16-bit unsigned integer instead of a
> > simple u32.
>
> Thank you for your patches. I'm fine with this, one remark though:
>
> Since at least the existing arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> is already using this I'm not sure of changing the svid property to
> an u16 is really a good idea from devicetree compatibility pov ?

Usually we try to keep DT compatible, that's true. And I also do not
fully like the u16 notation. However I'm not sure whether using full
u32 for explicitly u16 value is correct. I'll wait for the guidance
from DT binding and USB maintainers.

I'll mention the qrb5165-rb5 explicitly in the cover letter.

>
> Also the whole 16 bit property notation in the dts files seems
> less readable to me. So to me this seems more of something
> which one would use when having a significantly sized array
> of u16-s since then it will result in space-saving in the dtb.
>
> In this case I personally think it is fine to leave this
> as an u32.
>
> With all that said, I'm fine either way.
>
> Here is my ack for routing the drivers/platform/x86/intel/chtwc_int33fe.c
> bits through whatever tree is best to get this upstream:
>
> Acked-by: Hans de Goede <hdegoede@redhat.com>
>
> Regards,
>
> Hans
>
>
>
>
> > Dmitry Baryshkov (3):
> >   dt-bindings: connector: usb: add altmodes description
> >   usb: typec: change altmode SVID to u16 entry
> >   arm64: dts: qcom: qrb5165-rb5: use u16 for DP altmode svid
> >
> >  .../bindings/connector/usb-connector.yaml     | 35 +++++++++++++++++++
> >  arch/arm64/boot/dts/qcom/qrb5165-rb5.dts      |  2 +-
> >  drivers/platform/x86/intel/chtwc_int33fe.c    |  2 +-
> >  drivers/usb/typec/class.c                     |  5 +--
> >  4 files changed, 40 insertions(+), 4 deletions(-)
> >
>


-- 
With best wishes
Dmitry

