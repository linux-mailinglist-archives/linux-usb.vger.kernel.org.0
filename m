Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C99634CDC90
	for <lists+linux-usb@lfdr.de>; Fri,  4 Mar 2022 19:33:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241776AbiCDSeR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Mar 2022 13:34:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238993AbiCDSd5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Mar 2022 13:33:57 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0621115A209
        for <linux-usb@vger.kernel.org>; Fri,  4 Mar 2022 10:33:05 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id o1so10807918edc.3
        for <linux-usb@vger.kernel.org>; Fri, 04 Mar 2022 10:33:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:cc:from
         :subject:content-transfer-encoding;
        bh=pYtIzIXjkV/30U+YOHDMSLeoGHeOM7B85ouGOmUno+o=;
        b=Fi7v9Z3Hdb3vWTrpckKu0kv5AKYx03orRBhbCVw134YKAcsjlQ24ZBwwBEvciJLgS4
         oiY6qKQwYYb/A2NgQfadnhOP0iidKwRpdr+LtVrZnbaBnOvhcswk1cacWwzYVHkzX/pU
         QMKt0D123sPmQW1WRSOGt0xEOXUhzwhzb1lFaPOO1/JzBLLYGyx5bORqMWSE4w8YvPQm
         Hzg6W6VBtpWzoEgZgCEKP/2geeJ3nD16l5T9GipFbSQ7E0t1gzvue0xZ26OhcRRAlxuO
         3Z7ttDJR1DNioToq2gaiTyCrv8m3aGw76qaAeKV07sm53sksI0HULnTqVtZUjEk+Tzc7
         o+Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:from:subject:content-transfer-encoding;
        bh=pYtIzIXjkV/30U+YOHDMSLeoGHeOM7B85ouGOmUno+o=;
        b=nSUwL6+ErV2sIW7ErQVA0SPzMtog/So/lCDUxUIAQ6iihyW6czFSKBfGcXE4XAAlS6
         j9MAVU4ZWNrMX5j0TH9W2U2BGw9rHvgK7Xfx3wTK+GsChXBvB67XW1CQLIhR8v0PI//N
         oHAfWXBDE7gd/dgUsKfUPj8q1rEZZMogWROcqhW0MxSnAGsAFpHIxyDNjtsrft5Rcl8b
         7gsJSzyACxY+o26HW8ibvdGAmXhnonAJh7KE8nSui1xlQpGHwQ4o6uSCHERf9QAtcAyB
         2YLHwjqw526L+1ZWkZaU70sCxRI0e82XaLSRj8bYgKbcRKPBUlpPITOBaAaMjhoBzeeS
         JRbw==
X-Gm-Message-State: AOAM531j29RDruUEai0txqVpY3I+b++VnV6YuzQwCxufXD1nUcQqP+iu
        d6XOgqkzeX6zsXH1DQ6zu7U=
X-Google-Smtp-Source: ABdhPJwTgsCXP3ed8BuspF9LH6wx/80bS8q5RbLh7etQzuDyN05OJSGyWT7H5LbLUteD/oCQBPYKUA==
X-Received: by 2002:a05:6402:1908:b0:412:ee38:4186 with SMTP id e8-20020a056402190800b00412ee384186mr40436449edz.221.1646418783479;
        Fri, 04 Mar 2022 10:33:03 -0800 (PST)
Received: from ?IPV6:2a01:c23:b9fb:2800:c56d:9b34:f61c:e318? (dynamic-2a01-0c23-b9fb-2800-c56d-9b34-f61c-e318.c23.pool.telefonica.de. [2a01:c23:b9fb:2800:c56d:9b34:f61c:e318])
        by smtp.googlemail.com with ESMTPSA id s15-20020a056402520f00b00415e50f8ce1sm2184787edd.54.2022.03.04.10.33.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Mar 2022 10:33:03 -0800 (PST)
Message-ID: <18a93669-7f7a-dad8-38f4-44819fc3b64a@gmail.com>
Date:   Fri, 4 Mar 2022 19:32:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Linux USB Mailing List <linux-usb@vger.kernel.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Jack Pham <quic_jackp@quicinc.com>,
        Tung Nguyen <tunguyen@apm.com>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH 0/5] usb: host: xhci-plat: omit shared hcd if either of the
 root hubs has no ports
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I have a system with a low-cost Amlogic S905W SoC that supports USB3
but has a USB3 root hub with no ports. This results in an error
message and a hcd that is good for nothing. The USB2 root hub has
ports and works normally.
I think we can do better and omit creating a shared hcd if either of
the root hubs has no ports. This series is based on discussion [0].

The series works as intended for me. What I couldn't test is the case
of the USB2 root hub having no ports.

[0] https://www.spinics.net/lists/linux-usb/msg223416.html

Heiner Kallweit (5):
  usb: host: xhci-plat: create shared hcd after having added main hcd
  xhci: factor out parts of xhci_gen_setup()
  xhci: prepare for operation w/o shared hcd
  usb: host: xhci-plat: prepare operation w/o shared hcd
  xhci: support omitting shared hcd if either of the root hubs has no ports

 drivers/usb/host/xhci-hub.c  |   3 +-
 drivers/usb/host/xhci-mem.c  |  11 +--
 drivers/usb/host/xhci-plat.c |  43 ++++++----
 drivers/usb/host/xhci.c      | 155 ++++++++++++++++++++---------------
 drivers/usb/host/xhci.h      |  20 +++++
 5 files changed, 140 insertions(+), 92 deletions(-)

-- 
2.35.1

