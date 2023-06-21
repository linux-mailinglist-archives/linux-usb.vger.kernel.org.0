Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D146273841E
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jun 2023 14:53:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231750AbjFUMxp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Jun 2023 08:53:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230050AbjFUMxo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Jun 2023 08:53:44 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6092F10C2
        for <linux-usb@vger.kernel.org>; Wed, 21 Jun 2023 05:53:43 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3f9b4a71623so25574475e9.1
        for <linux-usb@vger.kernel.org>; Wed, 21 Jun 2023 05:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687352022; x=1689944022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h5YM9ZkTimPUsaVoBiXGj0BMz35QRXdMxYXrdXWCESs=;
        b=qxqYHtGf1oOyYgYYbeaBgyC1qJj/UwN9LSmkKfn3qUAcn4ofkxbFDUJkxFmmcZVvRv
         6IscpZjhP4o1Iz+rA61G47KB98weXRl37KkVWIcAt/OocLBK7kaLKEeQ8/YlmkQxQEVR
         9l0fk70XVha7ehaoucGQtsiqLeFNmnac53aTo7N05UK4hLDiOLP0ABqJg+6bNc7UmZST
         ieaTKvAv7lZmr9tQ1Orhnvxt7FFVput4b8NkiL0Ln6eozZKFDXO/5FtP05CJm4oSUEcW
         AzM4CLfuJaCzYY7Bu0skW83yU0xHMdYznN+6i3752lVSCMSwHrk966N4MlvOPSmFtPN1
         uECg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687352022; x=1689944022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h5YM9ZkTimPUsaVoBiXGj0BMz35QRXdMxYXrdXWCESs=;
        b=fx1n5yAO+05sCf3YMAcBuw2GmqHbMu6QhNrTYkvRrTt8+mJJDHMz5akgc7NfQSA6oc
         gZFyZlDfd4IsOhgs36NW38FXi/xyEdxICwAOWSBh+C25IbZsQFtTkxtXi9vMQAHGvVD7
         z3feau9AL7ql8RjqAD8irdgLwRVf3XZFLCGrPt3WhLKXOolZ7vUgqZZyaGEjNjTA5NjI
         CNj3kywCCFoSRWPTANuD5fypOIOxGforhItqJWtnVpSyJAHxMy3xgRa9TvBD5XBN2AWq
         nn7PDQB5pmo5OAXv+b12R8npGGzu2Nyu3Tria9koY3A/+eH21G/3bO46QI7nU/0uJ8JZ
         gokg==
X-Gm-Message-State: AC+VfDw0mGOUrGSornIhqbjeAUUiqzDyT9RKDAliOOt4alsJ31uLrSdh
        5zWJjNFQ+W1uKnlwsNehhLiyw4z7Sx3/c15g
X-Google-Smtp-Source: ACHHUZ7QzK/jGAUDTHwJn7tcDWkmxtBctLzhWPrN5DrygPKfYv7CYrWrPQNRD/1ZI16E4atDvM9RcA==
X-Received: by 2002:a7b:cb90:0:b0:3f9:c2f6:335 with SMTP id m16-20020a7bcb90000000b003f9c2f60335mr930873wmi.36.1687352021486;
        Wed, 21 Jun 2023 05:53:41 -0700 (PDT)
Received: from testvm.ubxad.u-blox.com (mob-5-90-143-93.net.vodafone.it. [5.90.143.93])
        by smtp.googlemail.com with ESMTPSA id y17-20020a1c4b11000000b003f7f249e7dfsm15202326wma.4.2023.06.21.05.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 05:53:40 -0700 (PDT)
From:   Davide Tronchin <davide.tronchin.94@gmail.com>
To:     johan@kernel.org
Cc:     davide.tronchin.94@gmail.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, marco.demarco@posteo.net
Subject: Re: [PATCH] USB: serial: option: add u-blox LARA-R6 01B modem
Date:   Wed, 21 Jun 2023 14:53:14 +0200
Message-Id: <20230621125314.7725-1-davide.tronchin.94@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ZJK9us5skqZHmawa@hovoldconsulting.com>
References: <ZJK9us5skqZHmawa@hovoldconsulting.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> > The first 4 interfaces of all the 3 configurations (default, RMNET, ECM)
> > are the same.
> > Here below you can find debug/usb/devices file of the LARA-R6 01B module
> > in all the USB configurations.

> Thanks, can you include this in the commit message for v2 as well?

Sure.

> Right, I had USB_DEVICE_INTERFACE_CLASS() in mind for the ECM
> configuration. That should avoid the need for RSVD().

If possible, i would use USB_DEVICE_INTERFACE_CLASS() for all the
R6 01B USB configurations. Something like:

{ USB_DEVICE_INTERFACE_CLASS(UBLOX_VENDOR_ID, 0x1311, 0xff) },
{ USB_DEVICE_INTERFACE_CLASS(UBLOX_VENDOR_ID, 0x1312, 0xff),
  .driver_info = RSVD(4) },
{ USB_DEVICE_INTERFACE_CLASS(UBLOX_VENDOR_ID, 0x1313, 0xff) },

Reservation is required for RMNET on port 4, as the RMNET port also 
has USB interface class 255:

If#= 1 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=ff Driver=option
If#= 4 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=ff Driver=qmi_wwan

What do you think?

Davide
