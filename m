Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C567B3B41E0
	for <lists+linux-usb@lfdr.de>; Fri, 25 Jun 2021 12:46:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231182AbhFYKsc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 25 Jun 2021 06:48:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230526AbhFYKsb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 25 Jun 2021 06:48:31 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99C53C061574
        for <linux-usb@vger.kernel.org>; Fri, 25 Jun 2021 03:46:10 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id c8so3948357ybq.1
        for <linux-usb@vger.kernel.org>; Fri, 25 Jun 2021 03:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=d5YWNPacjZGy0Wn0i1FPGx9+cX3LzXl1pss7rjm2gS8=;
        b=prxIRTYLAMJvuPpaz93iyA7cekZDrme8X4IVCe5wwqngwYiZBpBGglANs2LyeJSpGX
         UMe73i80S2lmAFUdY35UbY/vYf8Q3AxiDjNumdMqhZ2UAnnz0JNTLL8Iqw0sS847h3Dn
         y/Q1OMw7p9OrrwQ369tv8vxRuhoL3dR01k4ajC6siNEOBwB9v0X2V3qeT1sRKYMrMwnw
         3a5HW9JLxNNagWZPdTxVZeHO6rcgzjQb+r6EEIyAnzscV1lu+KUQctlnvdlOXuBuQXNy
         h9O8qs8new4wt4kuvmYDWdt+6tdsX9olc4cllhMXBlHClW7DvO6LCCEHH8ls59vEgqM8
         B/Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=d5YWNPacjZGy0Wn0i1FPGx9+cX3LzXl1pss7rjm2gS8=;
        b=RK9h+A3gFudnT4N+eF5ZjYhDgezRrWMI/gWqrEa/DzpVhIxLhGWFQb6jHL7u2erS40
         siguIsCmYyjwe0CBK4A9hXfj989B7jYdOOpMygLBBcgTkpHlRDWqWaVzJZzwz0s3a4yU
         H7ZZ/8/xqV7fxLOiLV2qrefy6uW+K+q7NGC567KcmnrW+QtFuMOlCkGdQINj+96l14R6
         Y/4lhNTa2u++IhEtbQwNoHcqj34RDNlkkPUSJ2kh0VTPgYTCya+QFWs6V9jcrHf1pvO9
         Ti0c4ESgyRbKde7a0tLXTui9V6vzfFFCVoRQou3wONjfjaLnvqlS7ceXgl8d8igbl4kQ
         lgIg==
X-Gm-Message-State: AOAM531SgplTcoiz3wu77RmbyGE26PZEMn+w3Cqefu4NELH7C6c3R9rO
        sVn31v3w9URrC+lTFG9hG1XzzuyvhSBEOK6Qf8kn7a1a
X-Google-Smtp-Source: ABdhPJx+qbBxybOmB+dBRwHjxTxoJajl688eLSyOwCbe/EKVw1cSVO00b8EMTwojhOASv03je2RV3g9EwUas+TW5vyw=
X-Received: by 2002:a25:3496:: with SMTP id b144mr11832019yba.70.1624617969885;
 Fri, 25 Jun 2021 03:46:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7000:464e:0:0:0:0 with HTTP; Fri, 25 Jun 2021 03:46:09
 -0700 (PDT)
From:   Laurentiu-Cristian Duca <laurentiu.duca@gmail.com>
Date:   Fri, 25 Jun 2021 13:46:09 +0300
Message-ID: <CAPm8-H6=X+++n8O3DLXxdLEh6RX9Qmche9ZYz5wfHb6=5aSyeA@mail.gmail.com>
Subject: Question about usb3 host code
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello linux-usb community,

  I am new to linux-usb code and I hope that my question is not silly.
I am interested in real-time usb.

  I know that on USB3, the gadget can initiate transactions
and I am searching for the function that is called in the usb3 host
when an USB3 gadget wants to start a transaction.
For example for raspberry pi 4 or other host.
Is it on the xhci host code or on the USB3 controller code (for example dwc3) ?

  Do you have any hints?
I appreciate any help.

Thank you,
Laurentiu-Cristian
