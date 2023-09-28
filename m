Return-Path: <linux-usb+bounces-685-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E927B15AD
	for <lists+linux-usb@lfdr.de>; Thu, 28 Sep 2023 10:06:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 9795928271D
	for <lists+linux-usb@lfdr.de>; Thu, 28 Sep 2023 08:06:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40C08328C9;
	Thu, 28 Sep 2023 08:06:33 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955EA1A5A7;
	Thu, 28 Sep 2023 08:06:31 +0000 (UTC)
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E70295;
	Thu, 28 Sep 2023 01:06:29 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-99bdeae1d0aso1622741466b.1;
        Thu, 28 Sep 2023 01:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695888388; x=1696493188; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WRqAccCJkomfQs/qVK90E1RJLOyaKeHdhVk58VjatG0=;
        b=lwSHlrRmb1p2XuwfjzRIyUthPvhkzDKu5CXUGoaKhB5BrC9iwFwkNscqzvL5OrhcAj
         JSfeI5s2slQN5YGi/6YTvPwPIAclit5ZQNaeIxP2DQQTrvk06h4DkUrIg8DtNs5ZcqJU
         BITU4MBNAJHu1yY7KrwCpA3kHb/899f8XYnHCPwKlyNlmxAONQ84D8A1zJ4BWKo2uLmg
         drmylQVfbF+cNsrgY0rjpCLWnwYuQFxjdVlJ/Y8pfQ7SO4VFLC+dDaFJSDJBhWD+G8mL
         zZASvlKXkNp3eka+tltmnjnpDuJuFK32r6mXEJyIXUTy6qezkLVcSybMDWQTe8UzIEqZ
         OkCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695888388; x=1696493188;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WRqAccCJkomfQs/qVK90E1RJLOyaKeHdhVk58VjatG0=;
        b=CEQE2GP6P6J/ITMKN5fUN9ilDhtoxFGDSj69Dpn9CqVzkoVkK2x4/zFcxD4WYDRLjR
         fLmxYlVs7LhD9ulg5sjYyeYKRk8lxghRSfc4LGAEafhmpzLzYq1612Jj7B0VCwoxKuML
         8cvhT1hI/qrjubP2ColNh1sNgiASshE8kotKQW1cMr8NbpKjdij+Gng7P+4ueL3pv8BF
         TvCWZFzru0BYXoI/lXIRnGqYy9D9oAmfw+gCSXGzFjALQj03DScxvE86v/GbIt5FHZ0S
         oqCLQaLk6qLg0zpaDt0SzlaCJq2HsneSgNgHWSI6RSCPGvLREtain7CdsfQIEOBvT1n2
         G+kQ==
X-Gm-Message-State: AOJu0YxrndBZxLfFZcLO8cRdCFJ71bAxLr+K21Ecm+P2KPbpfmU6lFwK
	9UsNr7o1j6jIpDxBj7cencg=
X-Google-Smtp-Source: AGHT+IEAyMnKV8ecvVOtvwLBfB9tIdiTiyiYenE+SVxW6AQyvBgpyfwzN6io1NWPyL4tWU5mP05M9g==
X-Received: by 2002:a17:907:7859:b0:9b2:b43e:4fcf with SMTP id lb25-20020a170907785900b009b2b43e4fcfmr549788ejc.64.1695888387574;
        Thu, 28 Sep 2023 01:06:27 -0700 (PDT)
Received: from primary ([212.34.12.50])
        by smtp.gmail.com with ESMTPSA id j26-20020a170906831a00b00997d7aa59fasm10707611ejx.14.2023.09.28.01.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 01:06:27 -0700 (PDT)
Date: Thu, 28 Sep 2023 04:06:20 -0400
From: Abdel Alkuor <alkuor@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: heikki.krogerus@linux.intel.com, krzysztof.kozlowski+dt@linaro.org,
	bryan.odonoghue@linaro.org, gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	ryan.eleceng@gmail.com, robh+dt@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, Abdel Alkuor <abdelalkuor@geotab.com>
Subject: Re: [PATCH v7 01/14] dt-bindings: usb: tps6598x: Add tps25750
Message-ID: <ZRUz/MDcDA7UnuF4@primary>
References: <20230927175348.18041-1-alkuor@gmail.com>
 <20230927175348.18041-2-alkuor@gmail.com>
 <77d9306e-ac55-48ab-8751-db43fd03523d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <77d9306e-ac55-48ab-8751-db43fd03523d@linaro.org>
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Thu, Sep 28, 2023 at 07:37:24AM +0200, Krzysztof Kozlowski wrote:
> On 27/09/2023 19:53, Abdel Alkuor wrote:
> > From: Abdel Alkuor <abdelalkuor@geotab.com>
> > 
> > TPS25750 is USB TypeC PD controller which is a subset of TPS6598x.
> > 
> > Signed-off-by: Abdel Alkuor <abdelalkuor@geotab.com>
> > ---
> > Changes in v7:
> >   - Define reg at top-level
> >   - Remove description from reg-names
> > Changes in v6:
> >   - Use reg property for patch address
> > Changes in v5:
> >   - Add tps25750 bindings
> > 
> >  .../devicetree/bindings/usb/ti,tps6598x.yaml  | 81 ++++++++++++++++++-
> >  1 file changed, 80 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/ti,tps6598x.yaml b/Documentation/devicetree/bindings/usb/ti,tps6598x.yaml
> > index 5497a60cddbc..9303d00b89de 100644
> > --- a/Documentation/devicetree/bindings/usb/ti,tps6598x.yaml
> > +++ b/Documentation/devicetree/bindings/usb/ti,tps6598x.yaml
> > @@ -20,8 +20,18 @@ properties:
> >      enum:
> >        - ti,tps6598x
> >        - apple,cd321x
> > +      - ti,tps25750
> > +
> >    reg:
> > -    maxItems: 1
> > +    minItems: 1
> > +    items:
> > +      - description: main PD controller address
> > +      - description: |
> > +          I2C slave address field in PBMs input data
> > +          which is used as the device address when writing the
> > +          patch for TPS25750.
> > +          The patch address can be any value except 0x00, 0x20,
> > +          0x21, 0x22, and 0x23
> >  
> >    wakeup-source: true
> >  
> > @@ -32,10 +42,47 @@ properties:
> >      items:
> >        - const: irq
> >  
> > +  firmware-name:
> > +    description: |
> > +      Should contain the name of the default patch binary
> > +      file located on the firmware search path which is
> > +      used to switch the controller into APP mode.
> > +      This is used when tps25750 doesn't have an EEPROM
> > +      connected to it.
> > +    maxItems: 1
> > +
> >  required:
> >    - compatible
> >    - reg
> >  
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: ti,tps25750
> > +    then:
> > +      properties:
> > +        reg:
> > +          maxItems: 2
> > +
> > +        reg-names:
> > +          items:
> > +            - const: main
> > +            - const: patch-address
> 
> This should be at top level. I wrote it last time - do not define
> properties in if:then:, but in top-level.
>
Sorry, I thought only reg that should be defined on the top level as
you mentioned in the previous review. I misread your intention that any
property should also be defined in top-level.

I will fix it in v8.

> Best regards,
> Krzysztof
> 
Thank you for your time and your patience.

Abdel

