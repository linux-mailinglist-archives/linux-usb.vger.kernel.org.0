Return-Path: <linux-usb+bounces-8670-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C673892B78
	for <lists+linux-usb@lfdr.de>; Sat, 30 Mar 2024 14:50:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AFE381F21E2A
	for <lists+linux-usb@lfdr.de>; Sat, 30 Mar 2024 13:50:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F1D11C0DFD;
	Sat, 30 Mar 2024 13:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d8GiuCMZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C919F1E500
	for <linux-usb@vger.kernel.org>; Sat, 30 Mar 2024 13:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711806641; cv=none; b=AgK1I6qExaY9AADtp6bidJQXzuUe5b13iN2o86d6Xohh2+FvNF5HVZAYwKYFSn46mWj7ER41s+yLUpW+uew0Nx6BvYCMxDdYcvC487yBR3A9XhdyiS9DzQTre+uYjE+pxIwReiE2Tlnt5LggHc+gUaYVj/NQyU4wIgeYdHAyJ7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711806641; c=relaxed/simple;
	bh=stMJSQMY3d7nXK++h59ucLYyDkPgF5M8gy6IuKuMK44=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=knlqahZUtrIeaR6NZ5+TIcnNzY4YZhV6dWg4ng0iDI0/8TLUg1hyHuRTd1AjajT8r+rFcsOXuM30loGfRdTFwIjcDtiyVi6p43kjt0QQ2+VBh4ypup/Y6TDaa4A9V4QFmK96vq8LRJSrR7cw2E/jj9xcfQzxkR8Tnn71T9uTBIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d8GiuCMZ; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5a49261093cso1496387eaf.3
        for <linux-usb@vger.kernel.org>; Sat, 30 Mar 2024 06:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711806639; x=1712411439; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Tx5mgCy/BFcGGKkVKhF/kQ+PLzQmx0bQp7pia88a2BE=;
        b=d8GiuCMZsT1GAZsuq7CTCnGY07Zv+qnC/kxSlZtvDk3TeY64sQ1jgeKzLStDG+sbWN
         re7LV3UmUNIk+gD3w3sSCEJODfxQBj6aMvnkWihdHHjGI2BMQm8VxpT2R3a2qKTpnII3
         klp/cKqKzke3eFlFuYNfubRM075Zai/bzlUOMFwX+kL4VLuh0/PT2GbSs9UHaT/+Bt0g
         wpXrUzuaks2gd1RxnNHzHCO+ZCU5mFLmLrqb2IfnBDuXnqpRxG0EA/W4YUBtCWvyDKHx
         sIMUxN0aseYKUrvPXlibJCfg8n+IMk6+jscria0QfXnFMR6S4WqQGJ8QUD27sH2/nZ9P
         hsRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711806639; x=1712411439;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tx5mgCy/BFcGGKkVKhF/kQ+PLzQmx0bQp7pia88a2BE=;
        b=ofXNQjqIUnzNOtYobu5aIHfitp50vZ6vxZDsMmkuZs87/OLpf0vMAmWEr64Cw8OtYf
         x0VvqBPfYhBe0i8pzflBOagcTFLXnwh7UTzwferuEvJR9vmmRlqehp/cwmDJhhbLn3kk
         VNR6ttKhWGQhPWYq5D6DoKixl33GtIUVPkuVvX3+BvbbGUAkeJWndP0BwsDVG6C/kYx7
         VlP3IzxHwyC6BBMLvLlrTqhS2z6lt9s25VJrWxsBOSh/++dR6z8g1Jr3baPov41Xa1Jh
         t021KQdaDHz3MdUCAv8n+X+orAPbxTsPwmztGTFkBVlflSpXJcr2vng+g/VwgQWcdiQZ
         dUIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbGMCrl9b/4D0Cuyzh+gAcHtrchKiAd2Qn1q2GzZwWGtMdfiALytS3aoPVIDKDpk1kq1t2DBJlruxvj9NCB08LEXq1o/X5KKyU
X-Gm-Message-State: AOJu0YyTIAcaC4+/4KgtA7BoXaZFUJ6lKeifjDW1a0QXkWq1hSKgPG9X
	RhRqvuhxrPO7mZxs3L4OLIpl9jarfr/Al+oDo3TpZdzbedhgGulZ7sjXMFVn5QmSd6Ri1aTyU+Z
	JurzUal6w+RO9oin8fDuLeQqOlzEqfqObtxLDVg==
X-Google-Smtp-Source: AGHT+IGbv8qLs0IWoyt7kJsOeorcao1nd+Pa3Lxd4VWzuSJ4BRurBHYW1VtnDH7rPpQ7PafyQHPdT7wirE+LXvlT+qw=
X-Received: by 2002:a05:6358:8a9:b0:181:65ae:874c with SMTP id
 m41-20020a05635808a900b0018165ae874cmr5293715rwj.8.1711806638748; Sat, 30 Mar
 2024 06:50:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240329071948.3101882-1-quic_kriskura@quicinc.com>
 <CAA8EJpqx+VFW8z6oG=+pnhPN97Q3R6z+ygf85Uspve-9syQsUw@mail.gmail.com>
 <6f2df222-36d4-468e-99a7-9c48fae85aa9@quicinc.com> <CAA8EJppa4hVBSenLgxc5MYxTfzPPf4exHvh8RWTP=p8mgB_RCw@mail.gmail.com>
 <44bc6ea4-eba9-4b80-bb07-3b744eb7cce6@quicinc.com>
In-Reply-To: <44bc6ea4-eba9-4b80-bb07-3b744eb7cce6@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 30 Mar 2024 15:50:28 +0200
Message-ID: <CAA8EJppBHEMQH-ge8ukjQrARc-70ZOJCDB0TF6D-qMqfmo08zA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] Add gpio-usb-c-connector compatible
To: Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Conor Dooley <conor+dt@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Guenter Roeck <linux@roeck-us.net>, 
	Bjorn Helgaas <bhelgaas@google.com>, Kyle Tso <kyletso@google.com>, 
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, u.kleine-koenig@pengutronix.de, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_ppratap@quicinc.com, quic_jackp@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Sat, 30 Mar 2024 at 15:46, Krishna Kurapati PSSNV
<quic_kriskura@quicinc.com> wrote:
>
>
>
> On 3/30/2024 7:09 PM, Dmitry Baryshkov wrote:
> > On Sat, 30 Mar 2024 at 11:13, Krishna Kurapati PSSNV
> > <quic_kriskura@quicinc.com> wrote:
> >> On 3/29/2024 6:23 PM, Dmitry Baryshkov wrote:
> >>> On Fri, 29 Mar 2024 at 09:20, Krishna Kurapati
> >>> <quic_kriskura@quicinc.com> wrote:
> >>>>
> >>>> QDU1000 IDP [1] has a Type-c connector and supports USB 3.0.
> >>>> However it relies on usb-conn-gpio driver to read the vbus and id
> >>>> gpio's and provide role switch. However the driver currently has
> >>>> only gpio-b-connector compatible present in ID table. Adding that
> >>>> in DT would mean that the device supports Type-B connector and not
> >>>> Type-c connector. Thanks to Dmitry Baryshkov for pointing it out [2].
> >>>
> >>> USB-B connector is pretty simple, it really has just an ID pin and
> >>> VBUS input, which translates to two GPIOs being routed from the
> >>> _connector_ itself.
> >>>
> >>> USB-C is much more complicated, it has two CC pins and a VBus power
> >>> pin. It is not enough just to measure CC pin levels. Moreover,
> >>> properly handling USB 3.0 inside a USB-C connector requires a separate
> >>> 'orientation' signal to tell the host which two lanes must be used for
> >>> the USB SS signals. Thus it is no longer possible to route just two
> >>> pins from the connector to the SoC.
> >>>
> >>> Having all that in mind, I suspect that you are not describing your
> >>> hardware properly. I suppose that you have a Type-C port controller /
> >>> redriver / switch, which handles CC lines communication and then
> >>> provides ID / VBUS signals to the host. In such a case, please
> >>> describe this TCPC in the DT file and use its compatible string
> >>> instead of "gpio-c-connector".
> >>>
> >>
> >> Hi Dmitry,
> >>
> >>    My bad. I must have provided more details of the HW.
> >>
> >>    I presume you are referring to addition of a connector node, type-c
> >> switch, pmic-glink and other remote endpoints like in other SoC's like
> >> SM8450/ SM8550/ SM8650.
> >>
> >>    This HW is slightly different. It has a Uni Phy for Super speed and
> >> hence no DP.
> >
> > This is fine and it's irrelevant for the USB-C.
> >
> >>    For orientation switching, on mobile SoC's, there is a provision for
> >> orientation gpio given in pmic-glink node and is handled in ucsi_glink
> >> driver. But on this version of HW, there is a USB-C Switch with its own
> >> firmware taking care of orientation switching. It takes 8 SS Lines and 2
> >> CC lines coming from connector as input and gives out 4 SS Lines (SS
> >> TX1/TX2 RX1/RX2) as output which go to the SoC. So orientation switch is
> >> done by the USB-C-switch in between and it automatically routes
> >> appropriate active SS Lane from connector to the SoC.
> >
> > This is also fine. As I wrote, you _have_ the Type-C port controller.
> > So your DT file should be describing your hardware.
> >
> >>    As usual like in other targets, the DP and DM lines from type-c
> >> connector go to the SoC directly.
> >>
> >>    To handle role switch, the VBUS and ID Pin connections are given to
> >> SoC as well. There is a vbus controller regulator present to provide
> >> vbus to connected peripherals in host mode.
> >>
> >>    There is no PPM entity (ADSP in mobile SoC's) and no UCSI involved
> >> here. Hence we rely on usb-conn-gpio to read the vbus/id and switch
> >> roles accordingly.
> >
> > This is also fine.
> >
> > You confirmed my suspicions. You have an external Type-C switch which
> > handles orientation (and most likely PD or non-PD power negotiation)
> > for you. It has GPIO outputs, etc.
> >
> > But it is not a part of the connector. Instead of adding the
> > "gpio-usb-c-connector", add proper compatible string (see, how this is
> > handled e.g. by the spidev - it is a generic driver, but it requires
> > hardware-specific compatibles).
> > Your hardware description should look like:
> >
> > typec {
> >      compatible = "your,switch";
> >      id-gpios = <&gpio 1>;
> >      vbus-gpios = <&gpio 2>;
> >      vbus-supplies = <&reg-vbus>;
> >
> >      ports {
> >         #address-cells = <1>;
> >         #size-cells = <1>;
> >         port@0 {
> >            endpoint {
> >                remote-endpoint = <&usb_dwc3_hs_out>;
> >            };
> >         };
> >         port@1 {
> >            endpoint {
> >                remote-endpoint = <&usb_uni_phy_out>;
> >            };
> >        };
> >        /* No SBU port */
> >     };
> > };
> >  > Note, I haven't said anything regarding the driver. You can continue
> > using the usb-conn-gpio driver. Just add a compatible string for you
> > switch.
> >
>
>
> Got it. So the "usb_conn_gpio: usb-conn-gpio" in [1]  to be replaced
> with something like a "typec- " naming convention and add a new
> compatible to gpio-conn (something specific to qcom-qdu) and use it in
> the new DT node.

It should be the actual name of the switch chip.

>
> Thanks for the suggestion. Is it fine if it put the whole of the above
> text in v2 and push it for getting a new compatible added to connector
> binding and usb-conn driver and then send v3 of DT changes or mix this
> series with the DT series ?

I think USB subsystem maintainers prefer separate series.

>
> [1]:
> https://lore.kernel.org/all/20240319091020.15137-3-quic_kbajaj@quicinc.com/
>
> Thanks,
> Krishna,
>
> >>
> >>    Hope this answers the query as to why we wanted to use usb-conn-gpio
> >> and why we were trying to add a new compatible.
> >>
> >> Regards,
> >> Krishna,
> >>
> >>>>
> >>>> This series intends to add that compatible in driver and bindings
> >>>> so that it can be used in QDU1000 IDP DT.
> >>>>
> >>>> [1]: https://lore.kernel.org/all/20240319091020.15137-3-quic_kbajaj@quicinc.com/
> >>>> [2]: https://lore.kernel.org/all/CAA8EJprXPvji8TgZu1idH7y4GtHtD4VmQABFBcRt-9BQaCberg@mail.gmail.com/
> >>>>
> >>>> Krishna Kurapati (2):
> >>>>     dt-bindings: connector: Add gpio-usb-c-connector compatible
> >>>>     usb: common: usb-conn-gpio: Update ID table to add usb-c connector
> >>>>
> >>>>    Documentation/devicetree/bindings/connector/usb-connector.yaml | 3 +++
> >>>>    drivers/usb/common/usb-conn-gpio.c                             | 1 +
> >>>>    2 files changed, 4 insertions(+)
> >>>>
> >>>> --
> >>>> 2.34.1
> >>>>
> >>>
> >>>
> >>> --
> >>> With best wishes
> >>> Dmitry
> >
> >
> >



-- 
With best wishes
Dmitry

