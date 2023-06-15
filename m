Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33B21731ED6
	for <lists+linux-usb@lfdr.de>; Thu, 15 Jun 2023 19:22:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238819AbjFORWf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Jun 2023 13:22:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229973AbjFORWe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 15 Jun 2023 13:22:34 -0400
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C65C2719
        for <linux-usb@vger.kernel.org>; Thu, 15 Jun 2023 10:22:33 -0700 (PDT)
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-3f9c1735984so31927621cf.1
        for <linux-usb@vger.kernel.org>; Thu, 15 Jun 2023 10:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686849752; x=1689441752;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rbupiR8gHfwAdf/+9rF4JmuzIqRAk1fExbDPZi36J18=;
        b=fBaCPJHAtBstbSCmFjWt1lXjm5dYG05isbqA6qsB60s6fxNqaH3uZASLrgGKEjdwxg
         BTAHEiLoEfe494f8N3n+4Hdv8zvkQ7SGNOag7iP+zF5rPDmFAa5CMZ1LCEwvDT5T67Qw
         a4zu2EKZXl8p42i2tDbYvqi2ele0/bIbMPPw4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686849752; x=1689441752;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rbupiR8gHfwAdf/+9rF4JmuzIqRAk1fExbDPZi36J18=;
        b=EN7mTbouoV1EvzD1mKTmwyIfLAARhmR7aoCe2dQE9T5GpiungozYbSqhFMLODND9Kc
         WVU6w237PHcNBSz4zdIM/CAdIsjgnZD427iIeCrd1EqUXTWr/rwzWdZJY6A8VHt5rOsS
         whApFNScvJMS9LTbTuubU38XgACbXor4ipv0RYrJC+gsa8ZWdSXnMFE4cySqBnrfR1Uw
         dOEiSD5mUa0x75bamN02RX4EYOucgwiiml52mC5HB+LoXLS9NEwRWN0MSgh1Rc0pcqnR
         gyuNnFxvR4IHxWAHn65oyKnhNmGmMmexzVoc0CdePwRmTQ35UqVtxKYfMFRoBeEStsM+
         DmyQ==
X-Gm-Message-State: AC+VfDxRk95HGCJt4vcc6uHdgbYjKDSGajwSi1pyD9D0FSGewthlyd0j
        SlFHy9/CdOAYV4yLo5nU6xhHmhViAVK+mnfF+Y9L7w==
X-Google-Smtp-Source: ACHHUZ7lMOFk4YWLhlUTFpjaybvVnuFfaTFDik0TeDX0haDn/fuDUS/xed2BX/A9N7dBRfGBPwdMraQjMgSmt9RFqjA=
X-Received: by 2002:a05:6214:29ed:b0:628:65c8:9c3c with SMTP id
 jv13-20020a05621429ed00b0062865c89c3cmr21860889qvb.27.1686849752351; Thu, 15
 Jun 2023 10:22:32 -0700 (PDT)
MIME-Version: 1.0
References: <2023060611-coach-entitle-d4e4@gregkh> <20230607193328.3359487-1-pholla@chromium.org>
In-Reply-To: <20230607193328.3359487-1-pholla@chromium.org>
From:   Prashant Malani <pmalani@chromium.org>
Date:   Thu, 15 Jun 2023 10:22:22 -0700
Message-ID: <CACeCKaci2nW5i2uVjXpLoOPJ5utBPJ4oSYwqs5CJzgz9PTL=LQ@mail.gmail.com>
Subject: Re: [PATCH v2] usb: typec: Fix fast_role_swap_current show function
To:     Pavan Holla <pholla@chromium.org>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        bleung@chromium.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 7, 2023 at 12:33=E2=80=AFPM Pavan Holla <pholla@chromium.org> w=
rote:
>
> The current implementation mistakenly performs a & operation on
> the output of sysfs_emit. This patch performs the & operation before
> calling sysfs_emit.
>
> Fixes: 662a60102c12 ("usb: typec: Separate USB Power Delivery from USB Ty=
pe-C")
> Reported-by: Benson Leung <bleung@chromium.org>
> Signed-off-by: Pavan Holla <pholla@chromium.org>
Reviewed-by: Prashant Malani <pmalani@chromium.org>
