Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66786487F18
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jan 2022 23:51:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231290AbiAGWv5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Jan 2022 17:51:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229474AbiAGWvz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 7 Jan 2022 17:51:55 -0500
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4868C061574
        for <linux-usb@vger.kernel.org>; Fri,  7 Jan 2022 14:51:54 -0800 (PST)
Received: by mail-pg1-x536.google.com with SMTP id t32so6782841pgm.7
        for <linux-usb@vger.kernel.org>; Fri, 07 Jan 2022 14:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=vqHiROslO0TpPmvf+ey7xFqm+bjBa1dLK4YmxWTgf8Y=;
        b=hrPltPUSQgqsGtHkOBXqG6MJdySA1QbbA40jaP+5pWSp5BRdjQ7mPjb5U/+5i79+ze
         Gd/If1QDpabwT0qfGhNjEOKgWhbBRxRnT6Iqkf6av4PFVGq2lf/d1EXIIAdrviMO6prH
         J9mw0OGkDGgL7CEkCeQUmC77hmfbRYWTC8RdY/Rq3RA0BLylkvEi2ebo2PzAs5a8ik+x
         38pgSYvb1BW+QVXEJLxVfPh3re3DYus5eOjClXdioT1ki0XSq8lFqk965rTaYemywajW
         WNWpTNTxn+P/4g264ZV7S/AWVilIrznbAwZ//uP5q8zPONetRr4KhICsTJY/ill2e8V6
         FC8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=vqHiROslO0TpPmvf+ey7xFqm+bjBa1dLK4YmxWTgf8Y=;
        b=WxAdhq/W9MF40qVnPX/1WtpKOr7/IrLBjgX+aflI2NXDivGMSciyYhj/8SXibKkV9N
         0TmoOl9UWE5D6UQU7D1i2V1gWpOoSfObIwoDahIhS7bbKpswgmgelSANZ+YEYRVtq28y
         DUcK8g4K5qhk1RdjMgG7QQmJLh0toeVmuVKWDWL0NocBr+u/dvFzQqGwU+UVS000x3ly
         u2xjonCghnqXFsOTzH20UKWH0s2ibQLfYKgX7IzqeXb0P3zrGb5AV39g8ksATit4QSM2
         ck67DESUDpoWhoy0S1OyQCgeMMoD+1XCGY/n7XqH97JZcuZXwG7IZaumKAP4PfrDwvsH
         m0IA==
X-Gm-Message-State: AOAM532GomoGy31OjwhdMp+1LD7Wf8HeUlx+M3pxrR47A8VWzAjSkaH1
        xQ6G2rSgY02/Hj/FpJcCKwceLnNaArqSXEVwkugleTyH
X-Google-Smtp-Source: ABdhPJzKanol2mxJhK4WrC++Xhb+0YM+bf6LQvdboD8EC3pcPYL8SE2WuLC4xKP/1OXg8rS56ADkwPq1kBJ95f8J8aY=
X-Received: by 2002:a63:81c8:: with SMTP id t191mr57999421pgd.598.1641595914084;
 Fri, 07 Jan 2022 14:51:54 -0800 (PST)
MIME-Version: 1.0
From:   Steve Rinsler <steve.rinsler@gmail.com>
Date:   Fri, 7 Jan 2022 17:51:43 -0500
Message-ID: <CA+gXaa6swV0NV-RuE3DUOQPbmOTF9uxyt+FkKnYEwK9p3QKkug@mail.gmail.com>
Subject: usb20cv.msi for Windows XP not accepted on my system
To:     USB mailing list <linux-usb@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

I downloaded a version of usb20cv.msi which was built for Windows XP
(64 bit) and it was not installable.  Error message to the effect that
it wasn't applicable for this system.

My computer is a Fujitsu laptop which used Windows Professional Tablet edition.

Not sure if there is another version just for Tablet edition Windows
XP or if for some reason I need to use the 32 bit version.  (I run 64
bit linux OSes, so that doesn't seem reasonable.

I will try to send a message to the folks at usb.org (didn't see an
email address to use for questions, but may have missed it.)

Steve Rinsler
