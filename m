Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E7EC4D6414
	for <lists+linux-usb@lfdr.de>; Fri, 11 Mar 2022 15:48:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245484AbiCKOtY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Mar 2022 09:49:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229586AbiCKOtX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Mar 2022 09:49:23 -0500
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28F8F4160A;
        Fri, 11 Mar 2022 06:48:20 -0800 (PST)
Received: by mail-oi1-f180.google.com with SMTP id z8so9559213oix.3;
        Fri, 11 Mar 2022 06:48:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=fv+NRm7Kc2RfkzcNyEkqZdH7J66FM5BfTas0lBIwSps=;
        b=m2dRkdkiU9uUG54l8MjYBMPiClDu5SuL0VldJEsRq1rdBN0r3RuAwG1lLqFIkAarMa
         zu7Ee0DhR4mFpSUriCfIYOsOTciCVZIA9zadEuhLjARiYqM7HONv5HrGQ0R45Fb3k82G
         SWqVDtplNMXLpkLwYfeJV2rbA8v79Yu88ZNXfuXCBinAdEUMg5/4P5JNTnTIshahyZVU
         B+441KzQ0IWe8AB3FTKHdFnu2CXAHJI6sGjlbFcUEIdkCUnreTeOXu3jhA28lTXknFyo
         GI1qRMPtt0TNVNjTB10InXl/RiLsx35fdDP5h2M+KZA34994TmAy/0TdvZubsgCXq+/J
         JKQw==
X-Gm-Message-State: AOAM5316x6m6w4mOSSYI+54h1ALKO6OIUWZ0VMQMU3Noyxl8OPyaP3lk
        w8JKT+2NyrABG8v8+stAmecEsls7Hw==
X-Google-Smtp-Source: ABdhPJwnDf3xsURTeS/hpUraIhvvIEM5ils/aDazPsL5Vb4miQqrSP7mZzDNGETgedvqA4BpScnJTA==
X-Received: by 2002:a05:6808:14cc:b0:2d9:a01a:48ac with SMTP id f12-20020a05680814cc00b002d9a01a48acmr13154340oiw.247.1647010099291;
        Fri, 11 Mar 2022 06:48:19 -0800 (PST)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id v18-20020a056830091200b005c928debf84sm1838802ott.75.2022.03.11.06.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Mar 2022 06:48:18 -0800 (PST)
Received: (nullmailer pid 3764520 invoked by uid 1000);
        Fri, 11 Mar 2022 14:48:17 -0000
Date:   Fri, 11 Mar 2022 08:48:17 -0600
From:   Rob Herring <robh@kernel.org>
To:     "Neumann, Bastian" <Bastian.Neumann@dentsplysirona.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>
Cc:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Richard Leitner <richard.leitner@skidata.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: usb: USB2512x boost value for up- and
 downstream ports
Message-ID: <YithMVvcOKbq76OU@robh.at.kernel.org>
References: <PH0PR17MB48481AC6D6B808D2C106C4AA8E0C9@PH0PR17MB4848.namprd17.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PH0PR17MB48481AC6D6B808D2C106C4AA8E0C9@PH0PR17MB4848.namprd17.prod.outlook.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Mar 11, 2022 at 12:09:42PM +0000, Neumann, Bastian wrote:
> This patch adds devicetree documentation for signal boosting properties.
> 
> Signed-off-by: Bastian Neumann <bastian.neumann@dentsplysirona.com>
> ---
>  .../devicetree/bindings/usb/usb251xb.txt      | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)

A popular feature all the sudden. Which one are we supposed to apply? 
This one or this[1]?

Rob

[1] https://lore.kernel.org/all/20220306184720.5350-1-tomm.merciai@gmail.com/

> 
> diff --git a/Documentation/devicetree/bindings/usb/usb251xb.txt b/Documentation/devicetree/bindings/usb/usb251xb.txt
> index 1a934eab175e..538ae49fc31d 100644
> --- a/Documentation/devicetree/bindings/usb/usb251xb.txt
> +++ b/Documentation/devicetree/bindings/usb/usb251xb.txt
> @@ -68,6 +68,26 @@ Optional properties :
>   - swap-dx-lanes : Specifies the ports which will swap the differential-pair
>         (D+/D-), default is not-swapped.
> 
> +Electrical signal boosting
> +The controller supplies a "boosting" functionality to drive up the USB
> +electrical signals. This could result in non-USB compliant parameters
> +(one example would be J/K level test). This should be <0x00> unless specific
> +implementation issues requiew additional signal boosting to correct for deraded
> +USB signaling levels:
> + - <0x00> : Normal electrical drive strength (no boost)
> + - <0x01> : Elevated drive strength low (~4% boost)
> + - <0x02> : Elevated drive strength medium (~8% boost)
> + - <0x03> : Elevated drive strength high (~12% boost)
> +
> + - boost-up : USB electrical signaling drive strength boost for upstream port.
> + - boost-1 :  USB electrical signaling drive strength boost for port 1.
> + - boost-2 :  USB electrical signaling drive strength boost for port 2.
> + - boost-3 :  USB electrical signaling drive strength boost for port 3.
> + - boost-4 :  USB electrical signaling drive strength boost for port 4.
> + - boost-5 :  USB electrical signaling drive strength boost for port 5.
> + - boost-6 :  USB electrical signaling drive strength boost for port 6.
> + - boost-7 :  USB electrical signaling drive strength boost for port 7.
> +
>  Examples:
>         usb2512b@2c {
>                 compatible = "microchip,usb2512b";
> @@ -86,4 +106,6 @@ Examples:
>                 serial = "1234567890A";
>                 /* correct misplaced usb connectors on port 1,2 */
>                 swap-dx-lanes = <1 2>;
> +               boost-up = <0x00>; /* no boost for upstream port */
> +               boost-1 = <0x02>; /* medium boost on port 1 */
>         };
> --
> 2.30.2
> 
> 
> -----------------------------------------------------------------------------------------------------------
> Sirona Dental Systems GmbH
> Sitz der Gesellschaft / registered address: Fabrikstraße 31, 64625 Bensheim
> Registergericht / court of registry: Amtsgericht Darmstadt, HRB 24948
> Geschäftsführer / Managing Director: Dr. Cord Stähler, Jan Siefert, Rainer Raschke
> Aufsichtsratsvorsitzender / Chairman of the Supervisory Board: Dr. Alexander Voelcker
> 
> -----------------------------------------------------------------------------------------------------------
> 
> 
> Diese E-Mail ist ausschliesslich fuer den angesprochenen Adressaten
> bestimmt und kann vertrauliche Informationen beinhalten.
> --
> This e-mail is intended only for the designated recipient(s). It may
> contain confidential or proprietary information.
> ------------------------------------------------------------------------------------------------------------
