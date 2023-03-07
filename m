Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 017926AD4E8
	for <lists+linux-usb@lfdr.de>; Tue,  7 Mar 2023 03:41:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229679AbjCGClp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Mar 2023 21:41:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229627AbjCGClo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Mar 2023 21:41:44 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1A852C66B
        for <linux-usb@vger.kernel.org>; Mon,  6 Mar 2023 18:41:43 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id u5so12641220plq.7
        for <linux-usb@vger.kernel.org>; Mon, 06 Mar 2023 18:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678156903;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lut75L1pnWHPvwMaef1gOvjSbOZTZlod+NFGGwIEhgo=;
        b=mRezdX1TCeDG5NcuvQZKjwinBw27vgyO4qhk2zmPLPULRcIe/5epsi7lj4v3/dw6/H
         6+qUX9Tjgdg9wgvieQA4uHdxfyUQXxOfdqK/gEnrtHkHF1IZLSxJ/9CHPgmDDJYWhAJh
         abv25NzUW+Q35+zp/R11GncS2R4Q7GTtTJ+iHqQffCmfT6s0BHn9nC5Zxp9kt0x95d6H
         BufH3+9xdNDsEfpDiViVYP1CvcvhvwJXTCaIasEpaXGCZfM6UK3TX2k8GzScgk30fni0
         aHtRg+GWBepxrZTnAERONvyV8Tw8ykOWa+RwzEkP7gXCbFFMgDKM9FtnqUCW+XETjNUt
         mI9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678156903;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lut75L1pnWHPvwMaef1gOvjSbOZTZlod+NFGGwIEhgo=;
        b=5pppMCQCQUnQ1GEEq2g8K19dEISQDss48TIheCSFa7/kaAYcsIl9FMdRmS9OccOpfb
         1qxaXh94ZRFF1a3FqyMyysnv5dO5XQjEROpsvx2cchets8JSjJfig11j+zUWt1odgQF0
         2fJNjcs13hArqdrptYTnVzUjTFBcWgROms8ehR7VpYZ3WJgv5NusdBNqBuDi3VCsrLx7
         aMqpRA3wT8w6WNElZ5qewxPpf265dMVoeMddEoGTNJt20LuFezBH03B4uOgEf2jdDi8w
         Mzlo6d08Q7UetI2D/wTzt8WidLEapAci3ADka+gbsaaCOI12PgWEZ/gZOFFrQMnUXAEs
         Ifnw==
X-Gm-Message-State: AO0yUKU+IP9X9ZqoH9n/wwhZsCKQdv7OSx9ey+vc5eIhD+vkFbGNnVkr
        UzAaCJXSZ8jvRjE0RGoYpHrddoZvfaq97y1IaoU=
X-Google-Smtp-Source: AK7set9GV4CLB98YzI9aemaoPnA37Zqq5FZtqAtefjV+95z/K1hud4lXbUwlVC7CSeRtAv7nReudOOCezTLh/n01FcY=
X-Received: by 2002:a17:902:64d0:b0:19c:a7a7:7072 with SMTP id
 y16-20020a17090264d000b0019ca7a77072mr5071565pli.10.1678156902803; Mon, 06
 Mar 2023 18:41:42 -0800 (PST)
MIME-Version: 1.0
References: <4772c6be-7918-9ab0-3dd5-983b293cf89f@gmail.com>
In-Reply-To: <4772c6be-7918-9ab0-3dd5-983b293cf89f@gmail.com>
From:   Ruslan Bilovol <ruslan.bilovol@gmail.com>
Date:   Mon, 6 Mar 2023 21:41:31 -0500
Message-ID: <CAB=otbTdBPwrot9aigxbOH+GFU=gFgEpr+io7cEv-5P10BSK9w@mail.gmail.com>
Subject: Re: Question about f_uac1 gadget
To:     Noah Causin <n0manletter@gmail.com>
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Mar 6, 2023 at 7:24=E2=80=AFPM Noah Causin <n0manletter@gmail.com> =
wrote:
>
> Hi,
>
> I was wondering if the f_uac1 gadget supports more than two channels of
> audio.

Yes it does, see channel mask configfs configuration options for
capture/playback
in the documentation for UAC1 function:
https://www.kernel.org/doc/Documentation/ABI/testing/configfs-usb-gadget-ua=
c1

Regards,
Ruslan
