Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B4896ABC0B
	for <lists+linux-usb@lfdr.de>; Mon,  6 Mar 2023 11:25:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229875AbjCFKZN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Mar 2023 05:25:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229746AbjCFKZL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Mar 2023 05:25:11 -0500
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com [IPv6:2607:f8b0:4864:20::936])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 804BC211ED
        for <linux-usb@vger.kernel.org>; Mon,  6 Mar 2023 02:25:09 -0800 (PST)
Received: by mail-ua1-x936.google.com with SMTP id n4so6031601ual.13
        for <linux-usb@vger.kernel.org>; Mon, 06 Mar 2023 02:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678098308;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vh7FN/ulAdnmY8O0LKz7bqpIFk4oOSQ9iCZ8VQ/AkNo=;
        b=XLGWJIk9ngr+DzzO288LuvJaM4tXJNvPNwQ2aS9Ags44qiVmrxsinzlSTI373SWvQL
         +6SgUcT0EwDOIVN2f57batbL6WGkZ2VjHiZD2U0ZfoB3ufKNwLox0AmmmOFBlt9HJ6RH
         OS5dvcaELSOGwrw7xfZFJ2NbgVH7MQKiyCspd7sI5fG3WOcHvbeWf9pH0zYeQabOYzn3
         yw9gnSfWn+YHaL2P9olrtireCVfXlHXeG4tpX1ltR43P7LxaSqE8ArqnuABg3RgkQyVT
         NPOLZ1x9kR7oCsOGhR6lezPY8aiclxT9jA/o8x8OVtbG9/bfL0WUzRZuLJI8IqemKCfK
         Id5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678098308;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vh7FN/ulAdnmY8O0LKz7bqpIFk4oOSQ9iCZ8VQ/AkNo=;
        b=xcAPwqUFQ5BLxUZBXzp/eifPGCybBMQn3nIBGlM9CkrLowKgd0jaPRp3v7CJWrID3A
         9E8mqTz9Pg9MOyYcDGDhdgkPnGvXgFUoY3ULmlzMI7IXIhv2iBBkm5oXvNm/5kIQqt6e
         oHO9PjtMQ9YjEf8dm6yaNEP3c+J+Xk+GBQNZMdTPgY0j94sp2aBf3NVly9H/o0Z7eK4H
         icUObtLDKSe4icTtNwV/xo/37cRXLTuzzKSL4IcFTV0DLT2ww5QyRE0RtTCEdUKZjyDJ
         sxwcJu1LF3epDzqHpEF2K4KeQGVBanAxJVNn8A7lAU5reKfLx+lGUh27KWBDdETMn+9A
         IK+w==
X-Gm-Message-State: AO0yUKUX1ZoMfuiCnNKuUXkb166V5twlaOIMDq43PYEfJRd7m7gsum4u
        E0BshG42KDstpDEv6+P8t6mw/ug06cjK04hTZG4=
X-Google-Smtp-Source: AK7set+HbxOG8fRWYdSd2Spe8YgeAHrZJbrwpyn/MCNLktCdTFpedrqR91TU0+OXtW6ZaqP/6B7py4FyO7omWVyWxwo=
X-Received: by 2002:a1f:1752:0:b0:401:f65:99c2 with SMTP id
 79-20020a1f1752000000b004010f6599c2mr6566336vkx.3.1678098308425; Mon, 06 Mar
 2023 02:25:08 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a59:ce6f:0:b0:3ae:930b:3e70 with HTTP; Mon, 6 Mar 2023
 02:25:08 -0800 (PST)
Reply-To: madis.scarl@terlera.it
From:   "Ms Eve from U.N" <denisagotou@gmail.com>
Date:   Mon, 6 Mar 2023 11:25:08 +0100
Message-ID: <CAD6bNBj=acZn6jpkuAhuMAxbq=prud3DvWJUd6YsqM0swBt35Q@mail.gmail.com>
Subject: Re: Claim of Fund:
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_SCAM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello Good Morning,
This is to bring to your notice that all our efforts to contact you
through this your email ID failed Please Kindly contact Barrister.
Steven Mike { mbarrsteven@gmail.com } on his private email for the
claim of your compensation entitlement

Note: You have to pay for the delivery fee.
Yours Sincerely
Mrs EVE LEWIS
