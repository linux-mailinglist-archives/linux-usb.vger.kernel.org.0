Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B89966368A
	for <lists+linux-usb@lfdr.de>; Tue,  9 Jul 2019 15:10:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726908AbfGINK6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 9 Jul 2019 09:10:58 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:47624 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726126AbfGINK6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 9 Jul 2019 09:10:58 -0400
Received: from mail-pf1-f198.google.com ([209.85.210.198])
        by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
        (Exim 4.76)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1hkptY-0008Oj-1z
        for linux-usb@vger.kernel.org; Tue, 09 Jul 2019 13:10:56 +0000
Received: by mail-pf1-f198.google.com with SMTP id 191so6277472pfy.20
        for <linux-usb@vger.kernel.org>; Tue, 09 Jul 2019 06:10:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:content-transfer-encoding:mime-version
         :subject:message-id:date:cc:to;
        bh=Dle3R/JKkJuvARNfD4j2spSdPlYkaOQ8jZ6z5Qf88A0=;
        b=gtVkHJ3CBxjKRJUNBODYjYN8matV/6ZLODWA/5zFOxK/ZYb3JXQCdiQpfpl6AWEyxX
         UzrxMJ2mi/M+zSWqP06BrDZ+TjneFBn6khfOtS58msik1+har5g3SWhQZtyvHaJD/2Qk
         aIaUM99XuRUDmP7ZxUf3X8n7KFp0k8DlA+aihQ+R42a3dRZXPlRpVmiMJnplN1D91Mkx
         S+ACzpCsKpnAfDnQZptKM5ThpBoKn/QIiZY6wSY28oGT6l6HlZuJ4Bu3dmyJxLZOrQxG
         g7anUxxsypRJfKDa2GXBasiZA5dQLKW8u+auKSjMcPlc9inteB5ohbeG9c/4EX7uSeHt
         VGxg==
X-Gm-Message-State: APjAAAX9HjNqBRe5lQX+LQWUBrM0v20YV9xVRCfa3RjDjZZsJTumAWVb
        wDLA+de83l2Fswe5fko9+vhcggFh5PvF1v8N62fd9VQc+YlIFVlmMjii9kTORop8Td3eYQkiCyO
        JC1uYWD47A93aEOXvK/XZhp++9X9Ayjr2QQF+PQ==
X-Received: by 2002:a63:f817:: with SMTP id n23mr30760734pgh.35.1562677854631;
        Tue, 09 Jul 2019 06:10:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw+JscG/oIDZCvSNZ9ftS2I2PR2LBnqUfsgLH98941/ARkm1AxzCpb81QGpks1mOId7EfZqYQ==
X-Received: by 2002:a63:f817:: with SMTP id n23mr30760689pgh.35.1562677854293;
        Tue, 09 Jul 2019 06:10:54 -0700 (PDT)
Received: from 2001-b011-380f-3c20-5cef-9a28-6766-fbdf.dynamic-ip6.hinet.net (2001-b011-380f-3c20-5cef-9a28-6766-fbdf.dynamic-ip6.hinet.net. [2001:b011:380f:3c20:5cef:9a28:6766:fbdf])
        by smtp.gmail.com with ESMTPSA id j15sm1366492pfe.3.2019.07.09.06.10.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Jul 2019 06:10:50 -0700 (PDT)
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
Content-Type: text/plain;
        charset=utf-8;
        delsp=yes;
        format=flowed
Content-Transfer-Encoding: 8bit
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Titan Ridge xHCI may stop to working after re-plugging the dock
Message-Id: <993E78A1-2A60-46D8-AA51-F4CB077E48D1@canonical.com>
Date:   Tue, 9 Jul 2019 21:10:47 +0800
Cc:     Kent Lin <kent.lin@canonical.com>,
        Linux PCI <linux-pci@vger.kernel.org>,
        Linux USB List <linux-usb@vger.kernel.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
X-Mailer: Apple Mail (2.3445.104.11)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Mika and Mathias,

I’ve filed a bug [1] which renders docking station unusable.

I am not sure it's a bug in PCI, Thunderbolt or xHCI so raise the issue to  
you both.

[1] https://bugzilla.kernel.org/show_bug.cgi?id=203885

Kai-Heng
