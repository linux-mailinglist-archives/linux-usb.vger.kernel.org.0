Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 107A5686AF7
	for <lists+linux-usb@lfdr.de>; Wed,  1 Feb 2023 16:57:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232361AbjBAP51 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Feb 2023 10:57:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232823AbjBAP5V (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Feb 2023 10:57:21 -0500
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82AAA77527
        for <linux-usb@vger.kernel.org>; Wed,  1 Feb 2023 07:56:58 -0800 (PST)
Received: by mail-yb1-xb34.google.com with SMTP id b1so22841134ybn.11
        for <linux-usb@vger.kernel.org>; Wed, 01 Feb 2023 07:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dOMZb+BmlKqGvyCJ5+QZgOhGuy3uepaGmbsDHdiXqoY=;
        b=iP/Z4tAaRwIDx7S7mNdCHVT35LxipyVStGPcoqDxfoc9gZ0KxFjD7M95PbE5UKO4DO
         SVPrRVnCLt1QIBsgxTC35i1N8bN2H562LnGxhNpPrWd2J4+lQj9/6Bq7yR37bCCIQKim
         tSl6Ug6j5phTh1lIFhhAjri/iRbQY0zQ+DBV0nvrJi+vOEPZIclVwc/0ldSzTB0FLwal
         7HIhJt3pBqMxzeJa5vuJ0RmAJPfTxClmsO8xQ9fBuktv6bBcP9ZnHG7entgVQW6AykBi
         1/abvc6ZOmYDQcoEeOtRuz5tyEW0VWRhXnUyYIMHZlTMtwLvXEFfhMSND9jyZEf2aoxt
         qQsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dOMZb+BmlKqGvyCJ5+QZgOhGuy3uepaGmbsDHdiXqoY=;
        b=upx8hA1xTuz2KdC2h79stKF8Ix9iURO5j0xeo1XpEvhgY68AXArMjgoftbqQzWPmXU
         nWZ/WO+WXiF/O41UxSQ34e9zZDR7PIwe5URYVjglAoYTj6HY1DWTAC3bp3iJxpNvXoy5
         vD9KoK2gpdymQ7evRFJ9BzxnouTG0YkNtrt+ejgI9sHo/MfbwynuX2zd7IB3BzeUMJnN
         W9S9DVXLjXTm2Mn+yWSjECDsmNMChOR41I54rTpSAYHgrD8QnCe0bdlfK3xjL4abd8wS
         PMC4X6+TT6kK7+1P7DVSKSVMMsP8YtwSPHwVRnl1Hi10CPq5wpWcLmpyL8GjLt1Pav2V
         YCWw==
X-Gm-Message-State: AO0yUKUzWNHa5UD3+MtS68/h4sfPRtShkCTU4qWRLf1svasgLIO6rxdO
        INXc0VQV/t7heszv1faD/OG5QtlOBIQGpv3tPa4=
X-Google-Smtp-Source: AK7set8D33I2Vvu3CtGaFxpGJPaWiPhaM3GSBJTM9q51jO5JnawRbvxhgKXZ613pUXP6A04TRTl3tDleVVAhJGef9+c=
X-Received: by 2002:a05:6902:1809:b0:80b:9d89:1849 with SMTP id
 cf9-20020a056902180900b0080b9d891849mr375184ybb.432.1675267017752; Wed, 01
 Feb 2023 07:56:57 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7000:32cb:b0:466:7fef:cc93 with HTTP; Wed, 1 Feb 2023
 07:56:57 -0800 (PST)
Reply-To: sherrigaher@gmail.com
From:   Sherri Gallagher <sherrigaller19@gmail.com>
Date:   Wed, 1 Feb 2023 15:56:57 +0000
Message-ID: <CA+zjTZFegCFFJutcrhYs=Q8pGRHCJhAHdF4papRViZ-Khf6S7g@mail.gmail.com>
Subject: greetings
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

-- 
I am Sherri Gallagher, I need your help.
