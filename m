Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFB483C8A08
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jul 2021 19:46:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229866AbhGNRs4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 14 Jul 2021 13:48:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229685AbhGNRs4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 14 Jul 2021 13:48:56 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51339C06175F
        for <linux-usb@vger.kernel.org>; Wed, 14 Jul 2021 10:46:03 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id x192so4547525ybe.6
        for <linux-usb@vger.kernel.org>; Wed, 14 Jul 2021 10:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=twWTz4cJ4/pojI2ckHLv7v+UR/b11ncv6YRnx7yzJu8=;
        b=mVOZS0y/R6c53ZFttc7B8n+hcZ53gctO2MhZe4fyF0ld775ulpEAD3p3f9s7/2GrSf
         OLeo/3dn2TWE3P3dhtRGAWK4TFKxfdKkn9ng1XHZMyQRibKDy3Pb8RAQv3MDdMuGFxRV
         ocfEv3q5433Yu2CucVF2WTonj+ZGzYkjB5ew3PPJ3gim8y6w1SPTmke/4VtxWO1JAUj2
         ROBBAwy5YIM/+nji32vbCpo5WTcGWON51+2cjMFJCwuCbwGeK+6T5H9sIhFkhqxb4Nba
         ds1bim5vbnPYHQVE6rwYjw91FYd52kMaM9L3LCgfXYk6iQSYgxB36ALmPoiKs5ySydU8
         Zs4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=twWTz4cJ4/pojI2ckHLv7v+UR/b11ncv6YRnx7yzJu8=;
        b=KP8Qf1WTwNiXBrh7zM530XbO9SdmyCm/Q3rpZpqw0FJcV+SCeimqo1H6CuBifFdHKu
         TZFk3SS43KcopCEVF8klRUMK7Din6cUDoCwilzaYUEItz1fyeqV6Gq2zRLqkjwaFB+mE
         CXcjl0PjIL8FGMsW/Tuq6L8lwn+4QhXomfdELVzagz4K0/VALr7mVGRiK44w3LZyyoiD
         WAxp7yQk3hQeVwrHMo+ds8IEhgFRJSA4qxG29PPvqlaCiNCJFVeDBbBme7vQqfyEr/Mu
         LEaNZTmpELO4x6gzv7TrltIEmrZzYwAnbVwws/a3AmJ3A558sjkYgmL6H7P7vtsFiOYV
         DTzg==
X-Gm-Message-State: AOAM532T0ASl1tFm3fmrwBLBUZkbMtm5AO1O9YE8O9h+Zxs0cFQvgNQY
        YdpZbkxGJF0EkJ6IN96c4sXtHgU5jfEOfZNfQ6ox+O2QyNAJPQ==
X-Google-Smtp-Source: ABdhPJylsinjWjvyksj3VyWmzJiUQabh4NKFckYhVwrQlU43+CU0iwe+nEhxibWdzYCkqZHactAd5SWLcBUcNsz80Vw=
X-Received: by 2002:a25:da11:: with SMTP id n17mr15154828ybf.428.1626284762417;
 Wed, 14 Jul 2021 10:46:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210714174004.3CC94C06175F@lindbergh.monkeyblade.net> <CABUoX8vULggf8kRMMwo9+gSCEy27nJ6ZdNj_HQb0Z4CtfQ3sWw@mail.gmail.com>
In-Reply-To: <CABUoX8vULggf8kRMMwo9+gSCEy27nJ6ZdNj_HQb0Z4CtfQ3sWw@mail.gmail.com>
From:   Hylke Hellinga <hylke.hellinga@gmail.com>
Date:   Wed, 14 Jul 2021 19:45:51 +0200
Message-ID: <CABUoX8u4XNknVmubMNYM64RO2jMHgefrVsfphHm_KGR8O9NW-Q@mail.gmail.com>
Subject: Re: Undelivered Mail Returned to Sender
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

REALLY GMAIL!?!?!?

Sorry this information actually belongs in:
ASMedia Technology Inc. ASM1143 USB 3.1 Host Controller causing random
full speed USB resets
