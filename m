Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CCD244E56E
	for <lists+linux-usb@lfdr.de>; Fri, 12 Nov 2021 12:12:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234371AbhKLLPg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 12 Nov 2021 06:15:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233883AbhKLLPf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 12 Nov 2021 06:15:35 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBF90C061766
        for <linux-usb@vger.kernel.org>; Fri, 12 Nov 2021 03:12:44 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id y5so8230031pfb.4
        for <linux-usb@vger.kernel.org>; Fri, 12 Nov 2021 03:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fibocom-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8gBigK4Teu5oHNnnaRy3MbJK8+fEmENHQh4QJbn3ip4=;
        b=vLliPvsW1AQ/kJJOSYyTN0JFur57k80WMbfA2O95e+vM7XXKjV7FxEPnUTnxPbZQyM
         NsIk91PJR3xyhbIb35PLPuhs3+3HkWJOkiZT2mKx703LOks+FKL3DGdL1YD6jYJr6K2U
         N6IbR5QcjSxfH60nNCb+XtbCHhvdsDLnn1bCwbWXhZxVADk2dmkfG9pOsyhxiq8Btd67
         UZ0IRnj5GXcDvQESbRJVKYLgkZls8PQeKjPfwTOn0HGcEvOeRTd2Da4hduQJDQ9HPpi+
         oA+98xl+jXF6vBkI3WHHTIHC3RzlAK7Gwe0Qf9Qhb2NpjsE61KveT4wQJ5zUFueacNky
         5aLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8gBigK4Teu5oHNnnaRy3MbJK8+fEmENHQh4QJbn3ip4=;
        b=8AwfEOcJxUnZ4XJvDdf00TF28S08IRejT1s4+iqJk1n0+tuIkOIkVSanUDmVB+w8wg
         TOCZI8bA0PjEgi/xYPr/fOdg38PRBIKTdc4VulxPJ6HZzOSoUqbNzBmi9pA0cuM4P3px
         BplEWEvP5S3k0VV83BjgncOCaXvXEH62b3sB0/YJ/QwarKeHUwM10B7/Zwl0cd+hyXPk
         THExxHhNgiLC7A2vfLLPylf9bx10Umi22OujYpiSMoVPvOKm7yRCcHdnQNbZHqfvAAZA
         VKbvUrBQok3NSz5NXpbK3nCk1klNVvDwlnc63ROSP4Mo0hOxVySDJgfJt/X8pRuK2Z02
         09SQ==
X-Gm-Message-State: AOAM533y+0TN0hN7xBKyC8fIa1X8K6vVpNVgm5N3ZNxX8tlP9UWm0A1n
        z0i8gFkUXEIBU4ElSehledekZT0+ZUl43BHg
X-Google-Smtp-Source: ABdhPJxLXhqy/2FbuRQz69MPFGBaWCmXvD7ia15ujP49GH9vPLI0V4GxCAnyjTgFBiwFX1AyZwHczA==
X-Received: by 2002:a63:1d13:: with SMTP id d19mr9539931pgd.383.1636715564125;
        Fri, 12 Nov 2021 03:12:44 -0800 (PST)
Received: from localhost ([103.95.66.60])
        by smtp.gmail.com with ESMTPSA id f7sm4934803pfv.89.2021.11.12.03.12.43
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 03:12:43 -0800 (PST)
From:   Super Zhang <superzmj@fibocom.corp-partner.google.com>
To:     linux-usb@vger.kernel.org
Subject: 
Date:   Fri, 12 Nov 2021 19:12:40 +0800
Message-Id: <20211112111240.752168-1-superzmj@fibocom.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

subscribe linux-usb

