Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21D1852E9D3
	for <lists+linux-usb@lfdr.de>; Fri, 20 May 2022 12:23:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346559AbiETKXF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 May 2022 06:23:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346302AbiETKXE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 20 May 2022 06:23:04 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ECA6E2776
        for <linux-usb@vger.kernel.org>; Fri, 20 May 2022 03:23:03 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id s3so10180898edr.9
        for <linux-usb@vger.kernel.org>; Fri, 20 May 2022 03:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=UqgoitLhyMN19YzP8hRzAqqQOEGPkVN4/V2PhW8+bOo=;
        b=bRdAUN6rJkGoDFmR6BRF/j9fmlwp1Wk51IrYNTbRpc0teqPSSIfThcJvKuGkgKljQ9
         Xt9IC8dPFpNUD4s4v9Nv4Xirn6go6z3XmU03mhL6f+KR0Wam5P104PEWlwaLBoLjKH6q
         umJj/Rw5WUfgQgAn6Ug87X9vJ7TDEIx+isWI1QS4rAA8fpOdcuDoQiBR3GGYf3p2F723
         1pPfmOD/H6QCCTm6rIAar+Q6t7ye6lUMQAetbt6dxmeaA2U7460qUUYxEYIz3RsS9Puu
         e5e9O1SUnEIaqTTqstYa7BOvilbCS8gJCUTh47kdr6vj5ATYuOzGOhm5jEclDnqBLKFB
         LdeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=UqgoitLhyMN19YzP8hRzAqqQOEGPkVN4/V2PhW8+bOo=;
        b=kZycj0/q7TivP6cWkqyn2LLteBnUzF/EeMftLuzQAv+Zr5yOxKW9ECySWJ/szkFthM
         T5CrUyG70Sjb62wgRiL135sDveVpUehX9ytm662UCSbbXtl1+qsNJgoFaZbFfWg83DLO
         52D5yXMxiHfVLxQtU555ZIMqioX8XgzM9LmM+9dqUi0Iwz3wo7fVGTj+bxMfMNd/q8l+
         E3yznQ/isLkrYCZWhBd/jcJ+hRXmEmGnZjadO3gC9gKTLzSX/Oe36UjYECrPwyXymZhn
         6vBpYQteqSczttcw1+g0ibq6IJlvidmeXEInG2SCzqcFqjy/+OJCQP2ucPYm4D/kbcCm
         xs2Q==
X-Gm-Message-State: AOAM531MGmY5NhfrcPQ/tSTWN+2dOAPG6Q6vddDY4nX3fh7tBJfO0oD2
        dsGeDgNd4PablOwBBoVCFefVXVyt1AWgZQS1x84K5YvarSs=
X-Google-Smtp-Source: ABdhPJy8IUjW3UAN1X7k7p+Uy2RrJYxBgZgb+MztzBE6C1NqzBS+5XapsyfNsI4WeBgRHjPIlg5I3wBClWOaN4U75Rk=
X-Received: by 2002:a05:6402:34d4:b0:42b:35e5:fc78 with SMTP id
 w20-20020a05640234d400b0042b35e5fc78mr395488edc.372.1653042181697; Fri, 20
 May 2022 03:23:01 -0700 (PDT)
MIME-Version: 1.0
From:   Stefan Hoffmeister <stefan.hoffmeister@gmail.com>
Date:   Fri, 20 May 2022 12:22:50 +0200
Message-ID: <CALhB_QNhzHkf4Yw6TqZAbCisMK6TBy8ecw0M_Sq=EQXPN728fg@mail.gmail.com>
Subject: Thunderbolt: One missing DisplayPort?
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I am trying to diagnose a problem where I get video output on
Thunderbolt on one DisplayPort, but no output on the second
DisplayPort.

I would love to turn on all the (kernel-level) logging output that
there is, but do not know how to do that.

Basically, on a Dell Inspiron 16 Plus (7610) laptop with Thunderbolt
4, I am running Fedora Linux 36 with kernel 5.17+.

Connecting that laptop to a Thunderbolt docking station (Intel
Thunderbolt 3 chip inside),
with two screens attached via DisplayPort, I get only one screen up and running.

I'd like to discover more about this apparent error mode, because
attaching a different TB3
setup works fine. I am looking for some means to enable logging or to
get debugging insight.

Generally speaking, I suspect that this specific Dell laptop
(configuration) has some challenges
in the BIOS, and with Thunderbolt in general, but am totally blind to
what is going on.

This system offers potential for fun, this being a hybrid PRIME
configuration, with an Intel iGPU passing through to an Nvidia dGPU
which seems to be the only wired-up way to get DisplayPort output.
