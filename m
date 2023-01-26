Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A67067CA44
	for <lists+linux-usb@lfdr.de>; Thu, 26 Jan 2023 12:49:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236978AbjAZLt4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Jan 2023 06:49:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237386AbjAZLty (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 Jan 2023 06:49:54 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F56C65F3D
        for <linux-usb@vger.kernel.org>; Thu, 26 Jan 2023 03:49:44 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id g205so933299pfb.6
        for <linux-usb@vger.kernel.org>; Thu, 26 Jan 2023 03:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=connectedcars.dk; s=google;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=s1k8jJEZub0cGC2UifvfG5lR+DZx44WZNUkTP6fbUPU=;
        b=Wl0mS34CanEhBtA/7FanDNJ51Ndaq/frrqHWv+z0VOJy8wzChDRQP52syiZ+5moP6u
         +WAq4eU8cEjKldFrxGbVLjkhTK78vzz/1OOhr4EpqeNcsU4zG54yPjOuVzQuvSao92RB
         wE8n1pqcguQkpk483X9yMv8bcxWUyo2pgJBFE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s1k8jJEZub0cGC2UifvfG5lR+DZx44WZNUkTP6fbUPU=;
        b=j9mUdkke8okb4+atzD7EZbtc7lUCT9SBL0ny1Ck445Bfq7nroEa0n7KxXBeKYrV1FT
         oO4bt26FGnmVcIt0hmRyIMC3lactXyq1aGDe0hiojSeYmLRRZi+wHze5SUmutGEpaIgK
         cMB/lo28VvT+TVvNs6h8JoOkQnX8g39b8QgvPYgPJR9Tk9DSMsP2yzUL5DTscddAAaC1
         BdRyQDA4q+Ew+KHmvh5RnqZ5adjpXdYtf5SBgL+JxUzsDfsa9fHDeLvEzpfd/bEj6aSR
         uUiMw5K4pUzA/yTE3SHmsrUqn1mcSapt3iLJFPMEqhmh5cT8NlTtDoWXvaeVfMPDiZTd
         go+Q==
X-Gm-Message-State: AFqh2kqAuMfA9pKFHNyJuLrrnPa1fim1T2wkqlqSAuMV83UCUu8YOm2V
        HGbjjBeScaVv7xftt5JNIETnoP6gAUNArBMRHt1uPg7aMKNZwDsBJm0=
X-Google-Smtp-Source: AMrXdXvifjbjv9+/r/c5v1NQZmsgio9zgtydIIPmc1+q1uSwg81XDfljdGWXBpx9xavErxyCjPhI1399EmwOKYR1gr4=
X-Received: by 2002:aa7:8a4e:0:b0:577:a0ce:6e5e with SMTP id
 n14-20020aa78a4e000000b00577a0ce6e5emr4014662pfa.21.1674733783413; Thu, 26
 Jan 2023 03:49:43 -0800 (PST)
MIME-Version: 1.0
From:   Troels Liebe Bentsen <troels@connectedcars.dk>
Date:   Thu, 26 Jan 2023 12:49:32 +0100
Message-ID: <CAHHqYPMHBuPZqG9Rd9i+hN9Mq89pRn6M_0PLsyWkcK_hZr3xAA@mail.gmail.com>
Subject: All USB tools hang when one descriptor read fails and needs to timeout
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

We have a hardware projekt where something is off with power ON
timing. It sometimes gets started in a broken state where the device
is seen by the USB system but does not respond to descriptor reads.

When this happens this causes lsusb and libusb based tools to hang
until the descriptor read in the USB subsystem timeout out after 30
seconds or so. It looks like the tools are trying to read
/sys/bus/usb/devices/.../descriptors and it blocks until the timeout
happens.

We should fix our hardware and have done so in the next revision but
why should one device be able to block the descriptors file that most
user land USB code seem to use.

Would there be any reasoning against just serving the descriptors file
as it looked before inserting the broken USB device instead of
blocking the read?

And if we wanted to create a pull request for a change like that would
it be accepted or would it be considered breaking the API?

Regards Troels
