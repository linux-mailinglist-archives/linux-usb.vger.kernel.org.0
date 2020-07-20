Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA82C225BF2
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jul 2020 11:42:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728322AbgGTJmO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Jul 2020 05:42:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728323AbgGTJmN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 Jul 2020 05:42:13 -0400
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B56AC0619D2
        for <linux-usb@vger.kernel.org>; Mon, 20 Jul 2020 02:42:13 -0700 (PDT)
Received: by mail-qk1-x72c.google.com with SMTP id g26so4432212qka.3
        for <linux-usb@vger.kernel.org>; Mon, 20 Jul 2020 02:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=K9I6H2Iwmvv+kwNH2lQLDVXODlEcj5FuNFAcRPsOzVM=;
        b=r3IWOtuBjon0dMaHNchhLJpFYsquDFaG+fUnLOludiK/XZ0u2lEo4LYOTcMhr/wAGX
         ghxZAC3q1IezNrQRjPCRS/M4vR7REMMq14VQUms6oFJgsCjIs3FuIwRMrHYDJs5xBYVL
         oBN58mTlJrPofz+5rWl2TdCpbfLvVcsAqZrZD5LCwYkygKxfYzcHTuYPvFJ+ncaOISmT
         y/HtA5ONOT7vEeDsewjk+WBZHV73DVLn1RGsRlOajLdGEqmIAXNXB2GMaWuVSqY/KdbM
         xwMVro/NZiLfrWU9NSJdtpFmdv4ts7pRVQ14QYRbu/Ikpk1Sy8gN65LCvTuACMbQijxW
         nfCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K9I6H2Iwmvv+kwNH2lQLDVXODlEcj5FuNFAcRPsOzVM=;
        b=rdL1Kt0zQuxVl7lgQAMCr2qfjt4zg77WQCDFq7+rmF6BcWwDZ5q/sL/ob2tpIqTint
         Hen7WVg4mRSrqjCcOr7eKF2OX3AtPmrmYqJKo6LEOQspdSvDHBKUWZG9QuUCFCM9W5M7
         nmbDug29TFxNVnC5RQ81JfgV0r7yyb87kvpSMTGGes3hKyqMXIKFdPvqNtTQtzQW5imL
         HTghiLMkcgmoRNwYbVjTVcZs1Uxsg/dPLn7EkmtYx6pTGsZGnB7X+1xq9D3TYHGhvb0p
         upZX/OaluGfnr62CJEgRWlmLDXBmX5+6TnKM6hOvKL4/Imk9pJ6JbqW55/pN1vss6GIt
         JnNA==
X-Gm-Message-State: AOAM530zY/rox/kBXdv20QJBZzUhtMopuuLkrHZs41GIhf4MHIRW5prs
        0/AEPpC6CJ+8yyIedUN/5K8U1S4w1a2Wk+0ZX/EQexyL
X-Google-Smtp-Source: ABdhPJyvPhiX6OEClsSg2YbqsSJvDn9ZpYSEm2c/0tsVWlkw32BrtnThKVMIqw9zrs0GKIf5X5hiXaY7utyPfRD22NY=
X-Received: by 2002:a37:9cd:: with SMTP id 196mr4388780qkj.234.1595238132662;
 Mon, 20 Jul 2020 02:42:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAGRyCJF03pVWdyw_G0vZZdOR8QW0c65xaN5KWs8HoWA8ymXZjg@mail.gmail.com>
 <20200720092816.GB836614@kroah.com>
In-Reply-To: <20200720092816.GB836614@kroah.com>
From:   Daniele Palmas <dnlplm@gmail.com>
Date:   Mon, 20 Jul 2020 11:42:01 +0200
Message-ID: <CAGRyCJEbpMknJi5GzMdGHdocJVzXA2XJJkOYLtjWFKbkNySyfg@mail.gmail.com>
Subject: Re: xhci status 'Babble Detected' and transaction errors with USB
 device performing UDP stress test through qmi_wwan
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello Greg,

Il giorno lun 20 lug 2020 alle ore 11:28 Greg KH
<gregkh@linuxfoundation.org> ha scritto:
>
> On Mon, Jul 20, 2020 at 11:21:47AM +0200, Daniele Palmas wrote:
> > Hello,
> >
> > I'm performing UDP stress test with an USB modem and kernel 5.6.12,
> > driver qmi_wwan
>
> 5.6.y is long end-of-life, can you try the latest 5.7.y release?
>

ok, I'll try to do this.

Thanks,
Daniele

> thanks,
>
> greg k-h
