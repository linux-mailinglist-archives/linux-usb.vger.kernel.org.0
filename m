Return-Path: <linux-usb+bounces-293-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D027A3813
	for <lists+linux-usb@lfdr.de>; Sun, 17 Sep 2023 21:31:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F21B11C20B37
	for <lists+linux-usb@lfdr.de>; Sun, 17 Sep 2023 19:31:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F2E76FD2;
	Sun, 17 Sep 2023 19:30:53 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D5C6FA7;
	Sun, 17 Sep 2023 19:30:51 +0000 (UTC)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E959211D;
	Sun, 17 Sep 2023 12:30:48 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-40476ce8b2fso31500015e9.3;
        Sun, 17 Sep 2023 12:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694979047; x=1695583847; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=65K8mCgmEtlpMY3z9VOkOvaOrG/VTVZNxKLA9kqTNW0=;
        b=mImcQPSeeGgaKIzSrGJ7A2NOGpggoEkSIIdTE9qFwxOv/A1XMdJygDW8jWdbOLkNyq
         52gfhulGuJHDTaaNvvoCuH9qxGNu1Ye5CcxwQPuFENwwTPazXuzeiFcdIpdL3RD0e5vA
         uGs54A/Jc29UEAdRev4xehPofCSmWkvO++Vrqrp1ZG7IVNFFIS1095TbMKBwbMzFQFAk
         LDSDXlIpXwCS6rYWr8IErlWImgOYZq3JDdZ0HAE18CDtmSodHlD4i1dEQ/o2QGFQdGek
         0mA29KzdKwedHVk2hw8O634ZS1aFzVzPa/Ouyxc62Z0/LaxR9nqxmctkGBy3TbV2bZAT
         l5VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694979047; x=1695583847;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=65K8mCgmEtlpMY3z9VOkOvaOrG/VTVZNxKLA9kqTNW0=;
        b=W5UwRoNUBqgQ/jQjWMA88wzaSimAOTFXbBeQ4pujO1V6gH1TDXnZ4a0bqvczIOSXi+
         GdkkPMPaedGvPtJGlXs3VIsWBLQzQ02+ZQ/pBwZ2aXi0H/nx1GziJCF7Hx5HwSGNyx2j
         CawkInDgh9CuUIy2V5cRpB9Zak4hkRS/0r1r+Pa461b5dJzDEJmOHjEZRPlm6CXWeoJQ
         SIU5DLG9cWyOD1LzMM7gTcx9hPv1wh48T7Oav6OGq7tHsxcFQSd4TaJ+zbVFNWLaMI3n
         dPaRnTQ4at5vxkSCVQLlPp0EmTxIql+U2Ld9vtQa3JhOwxk0Cc4ZGjh81GCZAaeaOlbQ
         Y8hw==
X-Gm-Message-State: AOJu0Yw+uJvDTnUY9eKmZEW+4/kXNgr3vDN5k/3T1wgkD8/HxN+hOWGf
	B0o/5BcIxeDXSpfrRoJPkIY=
X-Google-Smtp-Source: AGHT+IEZ5Sx1p0ZdSk+yrT/cIxqHnNIZVD8FaC6GGIoFcGg1Lq6rK7+e0PI3+qOkiax2m0hZ8VzhzA==
X-Received: by 2002:a05:6000:1744:b0:320:baa:eba1 with SMTP id m4-20020a056000174400b003200baaeba1mr2027666wrf.5.1694979047077;
        Sun, 17 Sep 2023 12:30:47 -0700 (PDT)
Received: from primary ([5.45.134.53])
        by smtp.gmail.com with ESMTPSA id d6-20020adfef86000000b0031f82743e25sm10412350wro.67.2023.09.17.12.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Sep 2023 12:30:46 -0700 (PDT)
Date: Sun, 17 Sep 2023 15:30:41 -0400
From: Abdel Alkuo <alkuor@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: gregkh@linuxfoundation.org, robh+dt@kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	conor+dt@kernel.org, linux-kernel@vger.kernel.org,
	abdelalkuor@geotab.com, heikki.krogerus@linux.intel.com,
	bryan.odonoghue@linaro.org
Subject: Re: [PATCH v5 01/15] dt-bindings: usb: tps6598x: Add tps25750
Message-ID: <ZQdT4RWSKhGeGYJ4@primary>
References: <20230917152639.21443-1-alkuor@gmail.com>
 <20230917152639.21443-2-alkuor@gmail.com>
 <384eb2c7-5aff-ef50-2f89-81cf8dd6e724@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <384eb2c7-5aff-ef50-2f89-81cf8dd6e724@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Sun, Sep 17, 2023 at 07:30:52PM +0200, Krzysztof Kozlowski wrote:
> On 17/09/2023 17:26, Abdel Alkuor wrote:
> > From: Abdel Alkuor <abdelalkuor@geotab.com>
> > 
> > TPS25750 is USB TypeC PD controller which is a subset of TPS6598x.
> > 
> > Signed-off-by: Abdel Alkuor <abdelalkuor@geotab.com>
> > ---
> >  .../devicetree/bindings/usb/ti,tps6598x.yaml  | 70 +++++++++++++++++++
> >  1 file changed, 70 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/ti,tps6598x.yaml b/Documentation/devicetree/bindings/usb/ti,tps6598x.yaml
> > index 5497a60cddbc..e49bd92b5276 100644
> > --- a/Documentation/devicetree/bindings/usb/ti,tps6598x.yaml
> > +++ b/Documentation/devicetree/bindings/usb/ti,tps6598x.yaml
> > @@ -20,6 +20,8 @@ properties:
> >      enum:
> >        - ti,tps6598x
> >        - apple,cd321x
> > +      - ti,tps25750
> > +
> >    reg:
> >      maxItems: 1
> >  
> > @@ -32,10 +34,45 @@ properties:
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
> > +  ti,patch-address:
> > +    description: |
> > +      One of PBMs command data field is I2C slave address
> > +      which is used when writing the patch for TPS25750.
> > +      The slave address can be any value except 0x00, 0x20,
> > +      0x21, 0x22, and 0x23
> 
> Why this cannot be another entry in the reg?
> 
This address is different than the physical address of PD controller.
The patch address will be used instead of PD controller address when
writing the patch. I thought reg proprity is only for a device physical
address, should I add another entry in the reg property in this case?
> > +    $ref: /schemas/types.yaml#/definitions/uint8
> > +    minimum: 1
> > +    maximum: 0x7e
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
> > +      required:
> > +        - ti,patch-address
> > +        - connector
> 
> 
> Why? Connector should be required or not required for both devices. What
> is different between them?
> 
The data-role for tps6598x can be extracted from system config register
which it doesn't exist in tps25750, so the only way to extract
this information is by using data-role property from the Connector for
tps25750, hence Connector and data-role are set as required for
tps25750.
> 
> Best regards,
> Krzysztof
>
Thanks,
Abdel

