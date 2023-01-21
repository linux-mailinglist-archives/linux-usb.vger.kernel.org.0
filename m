Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 504E16765B6
	for <lists+linux-usb@lfdr.de>; Sat, 21 Jan 2023 11:26:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229661AbjAUK0j (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 21 Jan 2023 05:26:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbjAUK0i (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 21 Jan 2023 05:26:38 -0500
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79D43126C6
        for <linux-usb@vger.kernel.org>; Sat, 21 Jan 2023 02:26:37 -0800 (PST)
Received: by mail-yb1-xb2c.google.com with SMTP id x4so7863881ybp.1
        for <linux-usb@vger.kernel.org>; Sat, 21 Jan 2023 02:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bkh4gPOqa0EfEkI7rZrn8V9sjISCcPdGeXtst4B+XX8=;
        b=VCOPZEJ4zTfo8weAI09S7rdGGjntP4cIAjebXXD01LaTsH9iK85knp7vjrbavoIBQ9
         x9w/wzrLYMPOP0Hk7s9ZeRsjgpXjH4s+iBCb7pgX71CkdDCwJ5rNFBd8a/nUSqUgXrgh
         u9ASNVpkV+SDoEzBRB5AvOrb77UEdo8JLh1gRi1GaJpmYkN2AJ/vxeIk/0RPiRKHr96H
         0g/Q/PE2KxO5FHC0BvY9m3bZTllWthihDcp7Pf7NcTPZ9nIYhRU/nSJRdW56VJsflAh5
         IXLRSHBWorv/7wf+b7D6XjftbiU1JTwdmYKwxKbqKL3KFJS8yn2nRb7dXcyloXFPQjQi
         I7Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bkh4gPOqa0EfEkI7rZrn8V9sjISCcPdGeXtst4B+XX8=;
        b=6HJ2xuk8Fa00dI9lDXGuazj8vco7rou5hhv/JuPLxUPOj/DBlUPwp4/puoO3gNiI3O
         6Sl7nK39SbdcdQAWWSiOCFJ9BVbdAeXRZCVJFtBNo3RJK4vl5RoAte+NhkLgdKdIEroA
         vb6svRWONt3OD7kdpMzn7K9Ty6BhLH26Kbz+g9ujIv3sasojSoyh5J0y5N2b0n1NZrN+
         ll5PebW+O9G58HoJYiQHLAWsZ3jZbUps0tZF0UEP3K/hk4z9dxSPWHrTeBiGUopc2PNt
         RZr2JZGAQI9vvcLsL2VCV7VK6D2b03cqDV/ZLqkEwOf9cPI/jseWEPmpJdLdi+Rgnofi
         8l4A==
X-Gm-Message-State: AFqh2kqYPyjJP9OgYOwZ0DEqX1aRglclFpFbsta6jettrrWkPLpW8TCG
        xWwmEJct1BjQpUQfw8Sffdsd7Pzbuq6l01d2alY=
X-Google-Smtp-Source: AMrXdXsy219ZsgszRW/NQRQBXz7YjiQ3c+1dcOi81b6bO1pcYhIq2Nn48kAOlA/Ld4WoojBOnhN5jG7Pc8kR/35b2+4=
X-Received: by 2002:a5b:c50:0:b0:7d3:2c3c:6643 with SMTP id
 d16-20020a5b0c50000000b007d32c3c6643mr1780716ybr.385.1674296796568; Sat, 21
 Jan 2023 02:26:36 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6918:d806:b0:107:4c3f:fae3 with HTTP; Sat, 21 Jan 2023
 02:26:36 -0800 (PST)
Reply-To: hbinquraya@gmail.com
From:   "Dr. Hamad B. Quraya" <s.kuchelbacher@gmail.com>
Date:   Sat, 21 Jan 2023 02:26:36 -0800
Message-ID: <CA+Oc328UiaYqcqVJNmmO7c71TOFzajzeO4SYLJV8ihscKBcaSA@mail.gmail.com>
Subject: Re: Capital Investment Placemnet.
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.3 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM,URIBL_BLOCKED
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Greetings From Dr.Hamad,

With all due respect am Hamad Bin Quraya from Kingdom of Saudi Arabia,
Ceo of Bin Quraya Group of Companies. I am writing you this email in
regard to my quest for an investment opportunity in your region. I am
searching for business opportunity in your country when I came across
your contact and I decide to open up communication with you.

I am interested in exploring ways to establish business in your
location as mentioned earlier due to the growing instability in my
region.

Kindly get back to me with your business ideas/business plan summary
for possible collaboration.

Looking forward to hearing from you.

Kind Regard,

Dr.Hamad Bin Quraya
P O Box 32058, Al Khobar 31952,
Kingdom of Saudi Arabia
http://www.binquraya.com



This transmission is confidential and intended solely for the person
or organization to which it is addressed. It may contain privileged
and confidential information. If you are not the intended recipient,
you should not copy, distribute or take any other action in reliance
on it.If you believe you received this transmission in error, please
delete this email.
