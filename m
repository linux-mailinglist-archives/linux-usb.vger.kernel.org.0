Return-Path: <linux-usb+bounces-3700-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1E2803B53
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 18:23:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 683EF281143
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 17:23:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 250AF2E645;
	Mon,  4 Dec 2023 17:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="icikd9uC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11FFE114
	for <linux-usb@vger.kernel.org>; Mon,  4 Dec 2023 09:22:56 -0800 (PST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5d6b751dabcso29184547b3.1
        for <linux-usb@vger.kernel.org>; Mon, 04 Dec 2023 09:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701710575; x=1702315375; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eYIlLpg3I1S2/DCODhdXuDSdzzNMxHCkGt3W+wzu1dA=;
        b=icikd9uCz+CQdn/q1kJ8HmrgcZeu8w4F5BJfUq6km+1YOsZRTaBfvXFmJkf8o4NEv3
         rxXYqOa09Rg+SZSplEWPWW22ET4qK8t3QMdDuSDFBNHAOlbyhFuOq7BFWpH5Ri0jxlv3
         BaD9AeG3pt1dtilxLDl/vBTGGqQ/Zd2brQsVnRh/en1hjEE6yoXJh04+74Ct1pOUZTwb
         brkB3ywLKnpBsHNeUvQfXcn6W/0surWidQ3lDDzrbxaVjSJHB8HI0MbGL1R9TEsg+tIp
         8ZxWFz9S9dYWW/mbnynP58o4mBq6WptV4sBTEalP89xeyfOB+kbWwr70ombkrE+yOsix
         CMvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701710575; x=1702315375;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eYIlLpg3I1S2/DCODhdXuDSdzzNMxHCkGt3W+wzu1dA=;
        b=IOeyqzAgOjnTyv7FFk8Cr2L0V425X6c2I9snziK3nIZEH7x91itkJ9V3GkYWpHp2L5
         ELHJp5GbR22Tm9HHg5zGcw/rni3Eb3JT1Kr6nrCuTTO3YJrkOENXrbNFVrZEIRQJuAZs
         7lmOq+xEqOpXhS0acIw2gkyZGibCZaLRIwLAYYK4WzEQ9KhrT+VZYn9G/Xz4KB3qpyiS
         0sipauffSUXcX5coVtxDK0Juog+4Z6MJL7dqoH08GqF2a0zMzgPWzpexMzD30Bq0ZcnV
         4eZ+Nle1poiXo/Nor0WJ29tOQEoRt5FGEFqkKlWoKHE8Ex8vg0NrAi0A+EjsEDJkPBSB
         YVIA==
X-Gm-Message-State: AOJu0Yx9F1oW6ict7/Np2ko3NrJDRQYoCXYP2kQAf+jqYBqncX4z+ut+
	hWgcitO0TDDRFGkGVzJ1kmfdm7KlxHM1
X-Google-Smtp-Source: AGHT+IEmjdCT006EwAVkuOdbjfLg0aBk7W1LnseA31cv0KUIXtIZL5jmNQ3ZhiLkWfsbqdpkQboG8ZXl8Tfc
X-Received: from kyletso-p620lin01.ntc.corp.google.com ([2401:fa00:fc:202:ac51:a57:5e72:a957])
 (user=kyletso job=sendgmr) by 2002:a05:690c:300d:b0:5d3:a348:b0b7 with SMTP
 id ey13-20020a05690c300d00b005d3a348b0b7mr315708ywb.7.1701710575070; Mon, 04
 Dec 2023 09:22:55 -0800 (PST)
Date: Tue,  5 Dec 2023 01:22:45 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
Message-ID: <20231204172247.1087152-1-kyletso@google.com>
Subject: [PATCH v4 0/2] mutiple selectable capabilities in tcpm
From: Kyle Tso <kyletso@google.com>
To: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	linux@roeck-us.net, heikki.krogerus@linux.intel.com, 
	gregkh@linuxfoundation.org
Cc: badhri@google.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	Kyle Tso <kyletso@google.com>
Content-Type: text/plain; charset="UTF-8"

updates in v4

dt-bindings: connector: Add child nodes for multiple PD capabilities
  - Modified the structure as corrected in v2
  - Modified the commit message

usb: typec: tcpm: Support multiple capabilities
  - no change

---
updates in v3

dt-bindings: connector: Add child nodes for multiple PD capabilities
  - Updated the commit message
  - Remain unchanged for the comments about the property/node
    refactor

usb: typec: tcpm: Support multiple capabilities
  - Changed the error handling and the usage of the APIs
  - Updated the commit message

---
updates in v2

dt-bindings: connector: Add child nodes for multiple PD capabilities
  - revised the dt-bindings

usb: typec: tcpm: Support multiple capabilities
  - Added missing cleanups in the function tcpm_port_unregister_pd

---
Original cover letter:

In commit a7cff92f0635 ("usb: typec: USB Power Delivery helpers for
ports and partners"), typec_operations has two new ops .pd_get and
.pd_set providing selection of different PD capabilities. This commit
implements these two ops in tcpm.

To support multiple capabilities, new dt-binding properties need to be
defined to create a tree structure for the driver to get each set of
capabilities one by one. The first tier of the child node under
connector is called "capabilities". Under this child node lies several
2nd tier of child nodes whose names are in the pattern of ^caps[0-9]+$.
And the source and sink capabilities are placed in these nodes.

Kyle Tso (2):
  dt-bindings: connector: Add child nodes for multiple PD capabilities
  usb: typec: tcpm: Support multiple capabilities

 .../bindings/connector/usb-connector.yaml     |  78 ++--
 drivers/usb/typec/tcpm/tcpm.c                 | 389 ++++++++++++++----
 2 files changed, 352 insertions(+), 115 deletions(-)

-- 
2.43.0.rc2.451.g8631bc7472-goog


