Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 311BF43D1B2
	for <lists+linux-usb@lfdr.de>; Wed, 27 Oct 2021 21:30:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240761AbhJ0Tcu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 Oct 2021 15:32:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231623AbhJ0Tct (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 Oct 2021 15:32:49 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A885FC061570
        for <linux-usb@vger.kernel.org>; Wed, 27 Oct 2021 12:30:23 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id u5so6493200ljo.8
        for <linux-usb@vger.kernel.org>; Wed, 27 Oct 2021 12:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=HsdGJe8g8OJU/pGK9sL43TkwtQBMS276g1B52ERLLVk=;
        b=AK2l+SrhJVik2zJ9uFa4LO0+M2EPoEqEQjZ2CfhkmI+NP/VuDGCGcgmSI3GTLdjP9y
         Q3sd7hh00Uo3BUYin7GtDCJao/qLlzCQvarPeXVTPMTADY3DVa5E+LstfnYxoBzxb7bA
         V+7+Jwci71Uy+Jx+YHfkn033YUMnhXrd584LlpZu9T3/U7MbWE11F1KxW4vf3oRGTlMs
         va9UqCvwvB6TP5kD4O5X3/Dq4o2axZofdWaHDpSlSl+3JwYjt/aiZTcbuZ/eFVbF1ici
         RKiYnn5iISXAXKDvLfglyIEdpOYOFAH2J6RIgNngkQLO3OCIQe2Jc87ZZC6HAJe54GtW
         /zDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=HsdGJe8g8OJU/pGK9sL43TkwtQBMS276g1B52ERLLVk=;
        b=av3d/gtZzOsBP3NQMFoSf2ibSrI9kI7wZAAwq9nY34+tLG9XSXqsvFyXsibGvVoXUs
         YciKcQsn1SnK02n/CTmcSBWwSqcN6zlGcmvYNymotsCZuc1mhk0l2isGzdPEYXXLlC8W
         /bGRhyXNk7JHZ4Yrq3YAvKjGAlLEW9PA30m5zwdQLrbmLBM4rZVucDgHSzsSe5Bl+Vqh
         19fj/01ffdeOBBfa2TRn6lPNPse585koKlCpS+uYZMvsYitvvujP7pKzdqGb6vyd74es
         dFAOJJFV5BJROOaJkg/T6V+qYvfaEO844364DBvX9//L3KIfjkR0Kt2p+ZVM+L5dkrAD
         35Qg==
X-Gm-Message-State: AOAM533EjHKYpN0URK9Xyh3E0/xqZX/QEj28znlET+R/XOFGT30JpYVB
        lrLTrcYAfEc4eiL7Uq52GmA=
X-Google-Smtp-Source: ABdhPJyQGX4CF/V6zfzrWhQPuMdaGYkGAH/7QpJl+Cyehq6TGuWpG6uyR+94Bux23obw/llHFbWn1A==
X-Received: by 2002:a2e:9849:: with SMTP id e9mr6129416ljj.503.1635363020796;
        Wed, 27 Oct 2021 12:30:20 -0700 (PDT)
Received: from dell-precision-T3610 (h-155-4-132-193.NA.cust.bahnhof.se. [155.4.132.193])
        by smtp.gmail.com with ESMTPSA id c24sm80928lfv.226.2021.10.27.12.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 12:30:20 -0700 (PDT)
Date:   Wed, 27 Oct 2021 21:30:18 +0200
From:   Lars Gunnarsson <gunnarsson.lars@gmail.com>
To:     Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>, linux-usb@vger.kernel.org
Subject: [PATCH v3 0/3] tools/usbip: Patch set summary
Message-ID: <20211027193018.GA14867@dell-precision-T3610>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

To forward a remote usb device over usbip the following steps is required:

1. Execute "usbip bind" on remote end.
2. Execute "usbip attach" on local end.

These steps must be perfomed in above order and after usb device is plugged in.
If the usb device is unplugged on the remote end the steps above needs to be
performed again to establish the connection. This patch set implements a feature
to persistently forward devices on a given bus. When using flag "-p|--persistent"
on remot end, the USB device becomes exported when plugged in. When using flag
"-p|--persistent" on local end, the USB device becomes imported when available
on remote end. Thus it is only required to run the usbip command once on each
end, in any order, to persistently forward usb devices on a given bus.

This is sent in three separate patches:
  tools/usbip: add usb event monitor into libusbip
  tools/usbip: export USB devices on a given bus persistently
  tools/usbip: import USB devices on a given bus persistently
