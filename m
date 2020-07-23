Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8293622B12D
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jul 2020 16:22:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728968AbgGWOWT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Jul 2020 10:22:19 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:48566 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726089AbgGWOWT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 Jul 2020 10:22:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1595514138;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc; bh=zSZAhL25JSXHpF0bAbKJRfBjeCgJ6YYI4dxlYgSnMIw=;
        b=Sm7Gmn9OBkhJNLgwyyBA6BPMcBawrHLy//SsDN2inGpmFdoeUy9M5uFdchje/8QiNEbzJd
        7wWZyZvlPXS7VVTC4MWUWamQt2wsDRAcjTIehLQ2EHI6KBftxccx5OaKsM2pCU/HsJiNqt
        u2dZFD+96HyQYHEmcXhdA48R9FHMuik=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-e7v3qmTINFCK6ABgH8fdbw-1; Thu, 23 Jul 2020 10:22:16 -0400
X-MC-Unique: e7v3qmTINFCK6ABgH8fdbw-1
Received: by mail-qk1-f198.google.com with SMTP id 3so3945852qkv.13
        for <linux-usb@vger.kernel.org>; Thu, 23 Jul 2020 07:22:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=zSZAhL25JSXHpF0bAbKJRfBjeCgJ6YYI4dxlYgSnMIw=;
        b=TJcjcp6bWIHekDpQ/cH0XCzTiL4/OF69u7/Gw6gLwQ8Fp09vtNktPzhZ8Eh/57U31Y
         Cm+Hq9ltQ4Q4j6L7O3xz80VNKnbAa6wUiwXVRnD/ibbB6b6ukqp7Sil2+r0soP3jpWY1
         bJ1lmCIU4IELm9QtwvZnIzSYLtGeLr2f/M6Yae9xmNLBD4GwCUTuXfXoGAKlWxF6uXkw
         5QP7SPrS360fWCUmzZXi1VjLrphv3c0oPm5VRK2rV7kk1oF2tFA8L7ycMSiqFSNro1HA
         /wzjzX1sXVIW+qApdjQjc+wjheOK7yZVoK7R4RvRTZ3x0V/eTtqZKaHP6vKJyWHXhvAS
         jW6Q==
X-Gm-Message-State: AOAM531Abou0o38kBZzTBKpVvPDIIjKRH3T/Yas2h8TOgh+UiF6F2HGx
        cbf4U9Ndfqj0qI+6mudhoFWhWxrqZAOwncr21kZYveNq2IQgo0qKg9G0Bx7ikMwd2ZQx00XOBl1
        c1uas2ADauYlC2LcbVZ7G
X-Received: by 2002:ad4:4bb0:: with SMTP id i16mr5099824qvw.42.1595514136248;
        Thu, 23 Jul 2020 07:22:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+P4z/SKan23uckp0U4ZwHA1Evj9o8JlarlIuBAqm40uOmGWRZUthDHWilRj8lh/rxbybNZQ==
X-Received: by 2002:ad4:4bb0:: with SMTP id i16mr5099803qvw.42.1595514136058;
        Thu, 23 Jul 2020 07:22:16 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id f53sm2225651qta.84.2020.07.23.07.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2020 07:22:15 -0700 (PDT)
From:   trix@redhat.com
To:     davem@davemloft.net, kuba@kernel.org, masahiroy@kernel.org
Cc:     linux-usb@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tom Rix <trix@redhat.com>
Subject: [PATCH] net: cdc_ncm: USB_NET_CDC_NCM selects USB_NET_CDCETHER
Date:   Thu, 23 Jul 2020 07:22:10 -0700
Message-Id: <20200723142210.21274-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Tom Rix <trix@redhat.com>

A link error

ld: drivers/net/usb/cdc_ncm.o:
  undefined reference to `usbnet_cdc_update_filter'

usbnet_cdc_update_filter is defined in cdc_ether.c
Building of cdc_ether.o is controlled by USB_NET_CDCETHER

Building of cdc_ncm.o is controlled by USB_NET_CDC_NCM

So add a select USB_NET_CDCETHER to USB_NET_CDC_NCM

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/net/usb/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/usb/Kconfig b/drivers/net/usb/Kconfig
index a7fbc3ccd29e..c7bcfca7d70b 100644
--- a/drivers/net/usb/Kconfig
+++ b/drivers/net/usb/Kconfig
@@ -252,6 +252,7 @@ config USB_NET_CDC_EEM
 config USB_NET_CDC_NCM
 	tristate "CDC NCM support"
 	depends on USB_USBNET
+	select USB_NET_CDCETHER
 	default y
 	help
 	  This driver provides support for CDC NCM (Network Control Model
-- 
2.18.1

