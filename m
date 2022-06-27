Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 928DA55DDC3
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jun 2022 15:28:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232273AbiF0HGT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Jun 2022 03:06:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232176AbiF0HGS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Jun 2022 03:06:18 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F737273D
        for <linux-usb@vger.kernel.org>; Mon, 27 Jun 2022 00:06:17 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id l6so7332594plg.11
        for <linux-usb@vger.kernel.org>; Mon, 27 Jun 2022 00:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=UjBI8t9mPHHRVolo2HJfmyEliWyFKXbFg/FjuklfOPs=;
        b=bYsf2/AMt9k21R0RJUrksBSZEyQwgzOym5NKFL0rfOo7r/joRQysANFNcNC+t7Kueb
         PIF+Bn56aLmlxTwzYMmGB076RjX6A2RSeZPw++cDff5l1GZBqrCUMAdYit/Rsg9Qg61I
         i2lQLYpg3AaNjNvB6hbTNz3PL89cRPQh81ZFo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=UjBI8t9mPHHRVolo2HJfmyEliWyFKXbFg/FjuklfOPs=;
        b=uhHWXTOek8hy04XzFx/vjMLdB+GUYUjeaO3bE6H9sPra5z2FvmzG0SZ2zlb+ZI4j/+
         EjLYfVKRxNTZ0zr7y0SoczbKdaHVW2O6oVst4GuBaOJcO1mXkIhCzZpxQUw/9oHs70tw
         bjj7zO6ZvGmbx3ksFyxFd+PwRoiApyOK8Y+as51Yt5gfn94xlcz3O5oGsBj5rBfHZsT8
         v2LcVhdZ7PzZr8GLYQnbbDkmGo8xqi9kDtu5Sylmyw44e6sZpbl9ajO9E9R/ANoa4CoU
         Ft3m/gYeQ6i+F+EEVZX79A+PCOX8838z3unn6tr7NUMc0sXDz8ygk8pnITLQHGl1HTMy
         irMA==
X-Gm-Message-State: AJIora8aEX4J4KMPMS5IbGgNsT//w/SN5LD1EOJ5s640ZF+jO7rKs3RZ
        81TDV6uEBTalUYCdFKbYV0a4wtZCGlaf9v1eyI8KC43xRAsynA==
X-Google-Smtp-Source: AGRyM1vbpv4vF56G4u5CA9PjDDOUw+SEWve02/caDjlR8dpspX6CK3KuRE0/g6jO3yl675TXmeLkvBnH4rKn3Kkl4Gg=
X-Received: by 2002:a17:90a:a40b:b0:1ec:a22d:5c3 with SMTP id
 y11-20020a17090aa40b00b001eca22d05c3mr19522272pjp.118.1656313576884; Mon, 27
 Jun 2022 00:06:16 -0700 (PDT)
MIME-Version: 1.0
From:   Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date:   Mon, 27 Jun 2022 09:06:05 +0200
Message-ID: <CAOf5uwnJ1Z4k6NSqdLZ0UNkbWMdoYgSRecwWNHXMH24_WVZrOg@mail.gmail.com>
Subject: f_hid GET_REPORT extension
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB list <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Felipe and Greg

I'm starting to write some code to extend the GET_REPORT and let the
userspace on the device side to pre-fill the answer on this request.
Right now the answer is always 0. The idea is to create a sysfs
support to fill reports struct on report request on the host side.
This will help to
emulate devices that export features report for example. As far as I
understand the hidg side just use read and write and read is used to
extract
the result of SET_REPORT is that the gadget is properly configured. Is
it the right direction?

Michael
