Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8256C4DBA82
	for <lists+linux-usb@lfdr.de>; Wed, 16 Mar 2022 23:08:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358229AbiCPWJp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Mar 2022 18:09:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351826AbiCPWJi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Mar 2022 18:09:38 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFFD514086
        for <linux-usb@vger.kernel.org>; Wed, 16 Mar 2022 15:08:22 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id d10so6985309eje.10
        for <linux-usb@vger.kernel.org>; Wed, 16 Mar 2022 15:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:from:to:cc:content-language
         :subject:content-transfer-encoding;
        bh=H5p7KDojsPR51UiFeLhop4zIdSM2nwHHhjG3xAzjwck=;
        b=TdrbpcdpwrFhtovYeWwlDnhBPxtQoqOAXBFyafrNLg3HFjufI3n4MTWHlq7HeuBSWT
         hIA2D01rnldgmY0kKapDeBaaP4PlQ44DSC9ObPJy5PFsl16yimSLzdlXbVpbyklHSrb2
         VFqeQg8iAyQX+1ZZ1l7Fdsmeq/sdvrqmNuP6amVjraMlaHb71rbFqrF3TgMvKxUm+Rf5
         CB0v05jX8w7DQ8Dq7F8sWYc8n3dQB0TxU/UtUlQyZeydThFGjfM3Wuoxa25GYpgdhfRt
         49oUR+Q9kJoLWu0JzNQc/fiXCb0rIO37gCq+HiB2SYejmirQJt0IhgejXP3b1lC3ObvE
         Ycqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:from:to
         :cc:content-language:subject:content-transfer-encoding;
        bh=H5p7KDojsPR51UiFeLhop4zIdSM2nwHHhjG3xAzjwck=;
        b=juG54wGD1NOB3tIMgNmuTBqQPrcMNx5JB2Wy9vxRKZTcAGN8gEgyrYOFBvbTYBKo1e
         izJoQemGIV+vEDU36LN2JpPfoyFVC1/4L0KpUtRpyiyNUmYhb2bck6IQ/ocvN6VLo63k
         4Bt2Z0m92bJEiaCI7ugyDTT0BCbsJup7UXouawaIsnlexH9S3Er4FX2ROkwEBC9vNwXt
         68ugPVXeaO8ZcexxvxZ61bOJhEKyd2WrJB5n8N27jD4GfzfP9t59kHKUkWbDpzdP0LFe
         Ej5SVzCzIL8/5JraRwusv/9A03soWR02tq6dKfhdDhsPpxyaFPHX+8H7vuncDC2b//ml
         qyXQ==
X-Gm-Message-State: AOAM533aVSMGGTVSeKWBT3YJWhA+zmwnpjkUnDDTvmDQu1OFakv2W05u
        DVp0FeYLjmZjgXcQFfHAiW4=
X-Google-Smtp-Source: ABdhPJzBwRQmn3QTHV9/qO6uSV4xPY7g695ypwauXXfmjgGtdX3YQSYfXkxG4c6aluSN9R4UfWb73A==
X-Received: by 2002:a17:906:be1:b0:6ce:c3c8:b4b6 with SMTP id z1-20020a1709060be100b006cec3c8b4b6mr1676819ejg.617.1647468501354;
        Wed, 16 Mar 2022 15:08:21 -0700 (PDT)
Received: from ?IPV6:2a01:c23:b866:cc00:e490:2de6:a89f:9b66? (dynamic-2a01-0c23-b866-cc00-e490-2de6-a89f-9b66.c23.pool.telefonica.de. [2a01:c23:b866:cc00:e490:2de6:a89f:9b66])
        by smtp.googlemail.com with ESMTPSA id u4-20020aa7db84000000b004136c2c357csm1646002edt.70.2022.03.16.15.08.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Mar 2022 15:08:20 -0700 (PDT)
Message-ID: <0684616b-5cc0-e9f6-7015-ce709c6d4386@gmail.com>
Date:   Wed, 16 Mar 2022 23:08:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Linux USB Mailing List <linux-usb@vger.kernel.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Jack Pham <quic_jackp@quicinc.com>,
        Tung Nguyen <tunguyen@apm.com>
Content-Language: en-US
Subject: [PATCH v2 0/5] usb: host: xhci-plat: omit shared hcd if either of the
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

Follow-up to this series could be applying the xhci-plat extension
to other xhci drivers.

[0] https://www.spinics.net/lists/linux-usb/msg223416.html

v2:
- reordered patches
- create new helper xhci_has_one_roothub() instead of using
  xhci_hcd->needs_shared_hcd (proposed by Mathias)

Heiner Kallweit (5):
  xhci: factor out parts of xhci_gen_setup()
  xhci: prepare for operation w/o shared hcd
  usb: host: xhci-plat: create shared hcd after having added main hcd
  usb: host: xhci-plat: prepare operation w/o shared hcd
  usb: host: xhci-plat: omit shared hcd if either root hub has no ports

 drivers/usb/host/xhci-hub.c  |   3 +-
 drivers/usb/host/xhci-mem.c  |  11 +--
 drivers/usb/host/xhci-plat.c |  46 +++++++----
 drivers/usb/host/xhci.c      | 155 ++++++++++++++++++++---------------
 drivers/usb/host/xhci.h      |  26 ++++++
 5 files changed, 149 insertions(+), 92 deletions(-)

-- 
2.35.1

