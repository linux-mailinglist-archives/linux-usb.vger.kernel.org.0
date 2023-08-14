Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F118977BF38
	for <lists+linux-usb@lfdr.de>; Mon, 14 Aug 2023 19:46:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231255AbjHNRqN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Aug 2023 13:46:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231289AbjHNRpx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 14 Aug 2023 13:45:53 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAEF910DE
        for <linux-usb@vger.kernel.org>; Mon, 14 Aug 2023 10:45:51 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5232ce75e26so1230a12.1
        for <linux-usb@vger.kernel.org>; Mon, 14 Aug 2023 10:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692035150; x=1692639950;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jF/V4kHEu6dWjvCLXINcspZHxUVaHudGNGJY39YzZSw=;
        b=HQsMb8xbe3dmLko5xvujjR6Vcrvv1HtIhhIicOGqVx6RWBwHI9an0gzJswg48khJRK
         FSzjYQOYFTXV6DQSXdGQVA2R2+LQD4hnzxbxYQdnKDpvI5gsIM2EpUtVUt5QuRpiWOE2
         FjXWCM+cEMjoy+Qt5LdcmpjElmJqvKhZ3qFOEP9qvXZRn5AwRvqAufRMee79ZjnDmyZc
         Fg/MfnmVm4H69YjLEtv7RoxnTJVqNz0Q0Fi0/Q62oELW8/aGBd108cqxXXzjEvnpK43A
         YJkkphuHFdwsiifjpow/u9SsA5qJXAARVrf5U83wkWq4Ln5GNuAKIdyZMDlKyxpvfI3O
         ZxJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692035150; x=1692639950;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jF/V4kHEu6dWjvCLXINcspZHxUVaHudGNGJY39YzZSw=;
        b=HiMGOacG7A0nSnFKy+CfDfrxTeVZKlJj0vroRiWQACI/OREtV89hchLIrl8NWb7UHq
         OLYVt5mXK8tbvKMKYMLuwMb9L3UTxEpaV5dPf3sw4hg3IhBWacRlg0SpsI7fO6QWQZ6z
         So9ioZZJg5Nws1kvygiTYCQvuVIWLinof8jshN8fWqolbiJt8vLp0XTN0+3jjwb8rMkD
         W0miaf7cOtSVH6ThWenkQiXyzNl3oTBMKuN7FcruwBm5AaO/molqeEQmk4VTjI++gGpQ
         /IjFCRwV6q0xCi1aHZKvtmLE8S4U8pwWyuFsugeohKqwA5wKSRWa2syV3OEZXzbFeXYK
         l46A==
X-Gm-Message-State: AOJu0YxFf6yVit8jzX+pAc+5e223ALEGyIeVBLslOxIKB9hW3Ypf8RK3
        OlBZpKG2BL/6arKzcyNG2os0fxHO7vsjxcNyjxf6ug==
X-Google-Smtp-Source: AGHT+IEnyYsVb2Bo0lmmh0BjmYS8cNkNBB5JmhiVTTF33gfGyr1/i/tlug9hGI2LcH9gaTYsafnkqTRxo9sH1D36n74=
X-Received: by 2002:a50:9fa4:0:b0:506:b280:4993 with SMTP id
 c33-20020a509fa4000000b00506b2804993mr262225edf.2.1692035150224; Mon, 14 Aug
 2023 10:45:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230811213732.3325896-1-rdbabiera@google.com> <ZNotwo3tRWMZta4u@kuha.fi.intel.com>
In-Reply-To: <ZNotwo3tRWMZta4u@kuha.fi.intel.com>
From:   RD Babiera <rdbabiera@google.com>
Date:   Mon, 14 Aug 2023 10:45:39 -0700
Message-ID: <CALzBnUGrtObMai=EedNM=+riroYaRq3mnzgLmGtQE8jeuM6pwQ@mail.gmail.com>
Subject: Re: [PATCH v3] usb: typec: bus: verify partner exists in typec_altmode_attention
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     gregkh@linuxfoundation.org, linux@roeck-us.net, badhri@google.com,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 14, 2023 at 6:36=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
> I don't think you need that ret variable:

Will fix this and Guenter's tcpm_log comment as well.

---
thanks,
RD
