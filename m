Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2C5D13A3B4
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jan 2020 10:22:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728797AbgANJWw convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Tue, 14 Jan 2020 04:22:52 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:41999 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726044AbgANJWu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Jan 2020 04:22:50 -0500
Received: from mail-pg1-f198.google.com ([209.85.215.198])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1irIPP-0006qe-If
        for linux-usb@vger.kernel.org; Tue, 14 Jan 2020 09:22:47 +0000
Received: by mail-pg1-f198.google.com with SMTP id 4so8122987pgn.7
        for <linux-usb@vger.kernel.org>; Tue, 14 Jan 2020 01:22:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=ZWAvW0Rz1fE7AgqGVyczDvEbs9mU6QRWoYteCf8IMgY=;
        b=oHTmxYJ/vLP06TpKhJouFFlwhzZrOKSVKITXa51WaETZyaf0dP9bcCS2GKV3JHi/wT
         VyDUYVyXS9IlbNigYvL0NZevZhV1lVjmEO2nFJoe182yX0mmyHWfomnoF/SFryUfL3Ts
         kw8Hd9aIv3YXC/E+BOzjSgXMU5N/qjOsdyOkOwNaDVg23BJmkDf1ciuv3sbh8KkakdeX
         9ldKknyfTKedEA9HfkebxHl7HzusZ7R44D7WzJ9YfpuUb5mOYQ3SF3TKGA2H8jGahkLQ
         QpNrel837gJJz2S+qk+NZ6Psd5q3b7S8D+zY55UZ2zFGt9phFFN0TON6CWGR3kKnz14I
         FyZA==
X-Gm-Message-State: APjAAAU6CtyrjfDNe+xASxPMCSLDb8smnTQWuVL++Ofwk+P8XmhVgjji
        gdPYtyeiWdDbXB998TSKl9DDGLDfLlHOh8Nxh5nzJyh++xytLKgWWdkoxIpWfUlWq5bmOFwSdhW
        Tp5jUnn4E0jX6HFl0u6X4/BLZmP/qyu0/qXaQTQ==
X-Received: by 2002:a17:90a:cb83:: with SMTP id a3mr27325367pju.80.1578993766159;
        Tue, 14 Jan 2020 01:22:46 -0800 (PST)
X-Google-Smtp-Source: APXvYqz/dfKdh6hyfCjf7/vtp3J9v7vz7wJtppmbIjvVArkf4ZL6hlcXyW/MQU84uBegDfMHDLn6Tg==
X-Received: by 2002:a17:90a:cb83:: with SMTP id a3mr27325337pju.80.1578993765891;
        Tue, 14 Jan 2020 01:22:45 -0800 (PST)
Received: from 2001-b011-380f-35a3-5d99-e277-e07f-4d26.dynamic-ip6.hinet.net (2001-b011-380f-35a3-5d99-e277-e07f-4d26.dynamic-ip6.hinet.net. [2001:b011:380f:35a3:5d99:e277:e07f:4d26])
        by smtp.gmail.com with ESMTPSA id a6sm15893776pgg.25.2020.01.14.01.22.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 14 Jan 2020 01:22:45 -0800 (PST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.40.2.2.4\))
Subject: Re: [PATCH] r8152: Add MAC passthrough support to new device
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <1578990223.15925.0.camel@suse.com>
Date:   Tue, 14 Jan 2020 17:22:39 +0800
Cc:     David Miller <davem@davemloft.net>,
        Hayes Wang <hayeswang@realtek.com>,
        Jakub Kicinski <jakub.kicinski@netronome.com>,
        Prashant Malani <pmalani@chromium.org>,
        Grant Grundler <grundler@chromium.org>,
        Mario Limonciello <mario.limonciello@dell.com>,
        David Chen <david.chen7@dell.com>,
        "open list:USB NETWORKING DRIVERS" <linux-usb@vger.kernel.org>,
        "open list:NETWORKING DRIVERS" <netdev@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: 8BIT
Message-Id: <A3D0DBA9-7014-48BF-8001-6F34EC2200B1@canonical.com>
References: <20200114044127.20085-1-kai.heng.feng@canonical.com>
 <1578990223.15925.0.camel@suse.com>
To:     Oliver Neukum <oneukum@suse.com>
X-Mailer: Apple Mail (2.3608.40.2.2.4)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> On Jan 14, 2020, at 16:23, Oliver Neukum <oneukum@suse.com> wrote:
> 
> Am Dienstag, den 14.01.2020, 12:41 +0800 schrieb Kai-Heng Feng:
>> Device 0xa387 also supports MAC passthrough, therefore add it to the
>> whitelst.
> 
> Hi,
> 
> this list is getting longer and longer. Isn't there a way to do
> this generically? ACPI?

ACPI only provides the MAC address, to write the MAC to r8152 it still requires hardware support.
So we need to use whitelist here, not all r8152 support this feature.

Kai-Heng

> 
> 	Regards
> 		Oliver
> 

