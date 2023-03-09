Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C86306B265C
	for <lists+linux-usb@lfdr.de>; Thu,  9 Mar 2023 15:11:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231433AbjCIOLQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Mar 2023 09:11:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231862AbjCIOKN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Mar 2023 09:10:13 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E80E4618C
        for <linux-usb@vger.kernel.org>; Thu,  9 Mar 2023 06:09:16 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id g3so1996177wri.6
        for <linux-usb@vger.kernel.org>; Thu, 09 Mar 2023 06:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678370955;
        h=content-transfer-encoding:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CpL8pfFHgYoyZ2Mo0Ft2NbfXGys8eh5PDeoz/LLjCnE=;
        b=MFfrdqA7s9hJHq81SIXzR/QdUY8FzZaBNe6vvo01/v1KVgL2SqhRKPqOMiWqBpnuc6
         xPkNCtNQwkTqobgBSwSKJF96ARiTH1EwsgkgxNhhB4Sl8XqI0UQa9ELbrfvNN5lWWjno
         ZP2TQNGWb3KzvBBjxxEiYr+zQksOsi3+56Jma2NSIuScDvptJANkhrm64oDbg8Sa0tZb
         h1UE/cGzWb06Vugu5NH0Gr7/gMVnFA2ATfywg3JXpV5QVIfc7DXjq9mQYJk5XUS68HGd
         G3KP1+qreQyyxNIyqQwitjrlsSnM25+dV5oiw1T+HLc0TTW3E2qpbYnmftKURABMyIwC
         MopA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678370955;
        h=content-transfer-encoding:subject:to:from:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CpL8pfFHgYoyZ2Mo0Ft2NbfXGys8eh5PDeoz/LLjCnE=;
        b=n/xduguXz3jdpkan3vs6BqPH4OIawPDRCxpTX72HksJXgu3epCSb8uvjz9sWW7d5nV
         DdGwCy+IvLk2zYNwZFFep5LpkAb4t5Jh2mcHUZJP+PFzZx0CtLreW+clDo0bG3s+tfJl
         4tOiYhOTvcYjHtGqTi+/IKkzmBKxNN0WwqTTX0dcyONtr8p0fGzDx8UTwt16q5buyN+P
         OZT4kc5vG/7KaM/kVIVzjQL34GIWQv5A52wlY7Y01NZRNq4oKCsbzoqDG0Ax1nC4aXXz
         QkZuJPB6GZwi0C3FCulYLm4xiNUymqcyrG0er2hbdt9MYCq0KVH91/L9o20OEZhXmR+z
         cFmg==
X-Gm-Message-State: AO0yUKUiXsgDJJ5SW66LngTX+YsiX0MpxKoBRbYurW6mNQQubLXed2ZD
        s69dOclRVMmQrjsnbP0CMsw6JdrK+4c=
X-Google-Smtp-Source: AK7set/bbIdbm9RCkxQSJCU3V7A+hbzhP4zIDZILaFrB22h2Mf5WSDhDZd7QSvxY7ZpfrGYFUgcjeQ==
X-Received: by 2002:a5d:54c2:0:b0:2bf:bf05:85ac with SMTP id x2-20020a5d54c2000000b002bfbf0585acmr15772487wrv.23.1678370955225;
        Thu, 09 Mar 2023 06:09:15 -0800 (PST)
Received: from DESKTOP-8VK398V ([125.62.90.127])
        by smtp.gmail.com with ESMTPSA id w7-20020a5d6087000000b002c567b58e9asm18209636wrt.56.2023.03.09.06.09.14
        for <linux-usb@vger.kernel.org>
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Thu, 09 Mar 2023 06:09:14 -0800 (PST)
Message-ID: <6409e88a.5d0a0220.5ab22.dd57@mx.google.com>
Date:   Thu, 09 Mar 2023 06:09:14 -0800 (PST)
X-Google-Original-Date: 9 Mar 2023 19:09:14 +0500
MIME-Version: 1.0
From:   terenceblake6795@gmail.com
To:     linux-usb@vger.kernel.org
Subject: Bid Estimate
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,=0D=0A=0D=0AWe provide accurate material take-offs and cost=
 estimates at low cost and with fast turnaround. Our team of prof=
essionals has been providing these services to General Contractor=
s, Subs (Painting, Electrical, Plumbing, Roofing, Drywall, Tile a=
nd Framing etc.). We offer both Residential and Commercial Estima=
tes and we cover every trade that you wish to bid, whether you wo=
rk with CSI Divisions or your unique classification. We use the l=
atest estimating software backed up by professionals with over a =
decade of experience.=0D=0A=0D=0AWe are giving almost 25% Discoun=
t on the first estimate.=0D=0A=0D=0APlease send us the plans or l=
inks to any FTP site so that we can review the plans and submit y=
ou a very economical quote.=0D=0A=0D=0ABest Regards.=0D=0ATerence=
 Blake=0D=0AMarketing Manager=0D=0ACrown Estimation, LLC=0D=0A

