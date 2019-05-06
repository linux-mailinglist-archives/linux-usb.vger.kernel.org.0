Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 866F5146F0
	for <lists+linux-usb@lfdr.de>; Mon,  6 May 2019 11:03:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725886AbfEFJDA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 May 2019 05:03:00 -0400
Received: from mail-ed1-f49.google.com ([209.85.208.49]:34142 "EHLO
        mail-ed1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725830AbfEFJDA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 May 2019 05:03:00 -0400
Received: by mail-ed1-f49.google.com with SMTP id w35so12826121edd.1
        for <linux-usb@vger.kernel.org>; Mon, 06 May 2019 02:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Qk2JoXMn4xFUELTZzmeIesazSLXtyS+86vxNenYt/i0=;
        b=SPk9UbqNHVEhkIvctbOKpuT/NH5RDJXML+2QgUNuhkCo9P2N/o9h4Qr7TbGh/rOq00
         +iAmtkSyxqYn/yLPM4Q67vqQlgxvPFuQ+etwZjCrfK17jzCFFYzdQL3Hf3N/xujzCsYf
         8jC4+t4r/KpmyoAs6TN8RWM+O9bHga6uDfxfdXyguscZf3rBbgVt3JdDz6j/lj9yaJ5Y
         /KbV9z7rhX7R6LwCjcCytP4VMtOJIyIGbmxiD9WLUl8/dloHanaDZ2zScsgttPl5LaY1
         Py0X46D3dDt0HNXvjMbL7u0NDWiFX4h4xuGN58KBcCbXIZlxA4SQvcdxmHXLHZVmb+lw
         sQ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Qk2JoXMn4xFUELTZzmeIesazSLXtyS+86vxNenYt/i0=;
        b=Rol6PSJ80dj15PpJpnrf9ieIN0twC+p2p7NHfjycE5p0RLsDpw6idAbj5Z+Tkx2r1x
         DQBYw6lRG+Hno5U9SpFKbLWEo34lDDxIRVGxYvTjw4shJfqMt0KBQiIOpq8K8lGT5WU+
         vGfvxQZUVcOyrldiS490vb+SowcSL+xDWmlxG1ygeCN9x21X42Qe3q6OtWehP+ZWb0P8
         v3etN6EVggTiFeDwQBRftyXjJXTTSYmKH4lUL4M6QpcF/GwGQgKJLixqAP6UTsDh6xi5
         flGmldj9Cw+9m8fkNsgA0wXeAaUGysf52GAaTphI5qPRL3JlTfQpb7NVJjXKLUefKk1K
         uMzg==
X-Gm-Message-State: APjAAAVlfw1o7Kk0R3haILCVKN28GMQG2jr/GXYymh0gHo79CNaUn1p0
        g+vywmRbz+HOhTySq0VeRH46AJbZdGM=
X-Google-Smtp-Source: APXvYqxDJFkziYrv6ESUV2igf661eziyJaRVJBoKjAmHaXEbOovdX16dUdv7GKDbIn2gntb7cUkcrA==
X-Received: by 2002:a17:906:60a:: with SMTP id s10mr17808330ejb.198.1557133378428;
        Mon, 06 May 2019 02:02:58 -0700 (PDT)
Received: from localhost (frost.nullroute.eu.org. [2001:778:e27f:a23:36c4:e19f:3c1:8a8])
        by smtp.gmail.com with ESMTPSA id c49sm5335eda.58.2019.05.06.02.02.56
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 May 2019 02:02:57 -0700 (PDT)
From:   =?UTF-8?q?Mantas=20Mikul=C4=97nas?= <grawity@gmail.com>
To:     linux-usb@vger.kernel.org
Cc:     gregkh@linuxfoundation.org
Subject: usbutils - various patches to the lsusb.py script
Date:   Mon,  6 May 2019 12:02:07 +0300
Message-Id: <20190506090241.169665-1-grawity@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

I accidentally ended up hacking on the lsusb.py script and now have an
assorted collection of patches:

- Output (controllers, hubs, etc.) sorted numerically.
- Color enabled by default when on a tty.
- Added --long-options.
- Replaced hand-rolled binary search with ordinary dict lookups;
  lost the -w (--warn-if-unsorted) option in the process.
- Cosmetic changes to make it look more like Python and less like C.
- Some changes to the output formatting that I liked to have in my own
  local version.


