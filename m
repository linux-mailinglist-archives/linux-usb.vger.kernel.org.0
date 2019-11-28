Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 525D710C9BE
	for <lists+linux-usb@lfdr.de>; Thu, 28 Nov 2019 14:43:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726655AbfK1Nnu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 Nov 2019 08:43:50 -0500
Received: from mail-wm1-f41.google.com ([209.85.128.41]:34690 "EHLO
        mail-wm1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726496AbfK1Nnt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 Nov 2019 08:43:49 -0500
Received: by mail-wm1-f41.google.com with SMTP id j18so7460187wmk.1
        for <linux-usb@vger.kernel.org>; Thu, 28 Nov 2019 05:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o+iHIxlIN4MptFBLCWkD6Hnybsie41iIVhFreDdUdvs=;
        b=R7zh1lfko1DMn6/CVNUdzYrx7i0Lbnb6Y73yYqnaEr7tb/4QZB4NqcxmB2eSNqhAbM
         493lYZgCtfOOrlSFfZvlVP/LrokhGWVgwd919bYCo9OBcATQDo2eSMZzZpzw0AOaM2yo
         nomr+u1Flwa4XMgwnQt0aK9sQnCEkSSgZmiJf1xdVi6JIMTA0I8UUak69FUXCDn2e5WN
         ryWNleR1eI+IvBjeCH8ZSgZUuuLx1/EjciuafJOyy5iEOgYyJaky4YVgo11JZ8WgSCcs
         YOa97w59/7yf9GD2/YPCR0y/cgapaBZsl5l0MvDzLkIVyLgxCK5yrL/d4FKz8ZoDQPKa
         cUvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o+iHIxlIN4MptFBLCWkD6Hnybsie41iIVhFreDdUdvs=;
        b=FDyxxcasMXQ6Tb37PDlwhvS8bExcMKO/ZlpEXezsRMGsP7CpS6RkXsY8/6oJTwzg7O
         0SjqCrTo8xqmGRESvjXgz8qZJFU75ES2lWXSuIYApcVN3RPNFBOT7KGmWC4Kk9XGY6D7
         P8PbsKEtfY4N6WoXUXjBEWg5FvH3em0XFhsbviUp1ex0ydVuj+6ivbySUadwYZM5Cinv
         3qd802hEDJi98+PM8R8HqCUA3w4ZijCgWC1SZkrUv5Eb/PtuX6tQJ7bIan29bcDo8SiY
         a0TYHvvNTf3xa7zPSXNrAXfGCbh5SHPs6KA4SY1fuuO8aR04T06lb/OhZS3I3HGQ9uAk
         A5OA==
X-Gm-Message-State: APjAAAUuW+JS/fLcet81t5ek7xRv+RIU+aHRZH1jjqFCVLypwqjeYUsZ
        v9fdZf+hunInwYeR5H8OwyR6LQ==
X-Google-Smtp-Source: APXvYqwQq5k81aEfW2o6MsMt6nrxm9MGC22wBYXxX2SkF/MpRhdORS/Y2lwvt+cOdPSGA3i4YKjm7A==
X-Received: by 2002:a05:600c:230d:: with SMTP id 13mr4659024wmo.12.1574948627390;
        Thu, 28 Nov 2019 05:43:47 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id u26sm10743407wmj.9.2019.11.28.05.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2019 05:43:46 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH 0/2] Two minor USB related fixes
Date:   Thu, 28 Nov 2019 13:43:56 +0000
Message-Id: <20191128134358.3880498-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This set contains two minor USB related fixes.

The first patch fixes usb-conn-gpio. We should not print out an error
message when trying to get a handle to a VBUS regulator, if it is a simple
deferral.

The second patch fixes the description of the USB connector bindings. It
reads a little funny lacking indefinite articles.

Bryan O'Donoghue (2):
  usb: common: usb-conn-gpio: Don't log an error on probe deferral
  dt-bindings: connector: Improve the english of the initial description

 Documentation/devicetree/bindings/connector/usb-connector.txt | 4 ++--
 drivers/usb/common/usb-conn-gpio.c                            | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

-- 
2.24.0

