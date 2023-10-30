Return-Path: <linux-usb+bounces-2358-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6453E7DBE97
	for <lists+linux-usb@lfdr.de>; Mon, 30 Oct 2023 18:14:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6F9A2B20E4C
	for <lists+linux-usb@lfdr.de>; Mon, 30 Oct 2023 17:14:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD2B619464;
	Mon, 30 Oct 2023 17:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u2it7Zra"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19EA219454
	for <linux-usb@vger.kernel.org>; Mon, 30 Oct 2023 17:13:59 +0000 (UTC)
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD595B7
	for <linux-usb@vger.kernel.org>; Mon, 30 Oct 2023 10:13:56 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-da03ef6fc30so4369956276.0
        for <linux-usb@vger.kernel.org>; Mon, 30 Oct 2023 10:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698686036; x=1699290836; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=N/14nE/fQrv7yXeUiJ0T0oqRncNS6lZV+I39ngsgxFM=;
        b=u2it7ZraGVU/6AnVqJrlWSr4t+dPy1Z64bAnK6Wg7nmQcZBcEZtqU/+L4b+zK3rvL8
         QcXnhZjWNBNDwC7P1ekWKt8hyKlZF2aiF8bD0JJO7xDQ4aXRZbRzM45bKZfq5p535Dot
         8pt2kLTzvKyjaFPKomQ7jaefYVgw9gqmZorp/paNRi7DSUmBavhSwnFXEQawmykENW5z
         M9CVk6f0AkEId4AvnsIHN+AHzn3UelF168Pc8u4x6ZwIWKe42t7UI0O9Pk+BkUJJjtYl
         eGn1XwM/k00qqYBZ/2ZCaFG6YsMXbPipYWTXwlDUKtJgnWjsb1oF2INEbCJFgGQzZIA8
         vgXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698686036; x=1699290836;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N/14nE/fQrv7yXeUiJ0T0oqRncNS6lZV+I39ngsgxFM=;
        b=cFBnm/3cm8avxYWm2vLQTFfjVfIYPFRaglAcna94GRGnlWjI1+QYxwb8TRTUaDN+cb
         UAIYtc5lhIVOyWftKbias2bKdX14cLuDzE6VmguDynh2Ark/I7Qp49PJMUesZV9pvY7v
         XIOvMh2yu1YT+yy8qxx3JJLVSEiY9irJwGtBhlIULfcrO1kwtxrP+qA8GJQi9pzpfv9e
         Ui/wee+KP0J4OQrHXq2j56JG7lUj2vLjPQLhqWIVuCiOaobRUeTPQIlh3YOfd7gxbqrb
         RXtC7gB76Qqx9HKb9YuvuicEepgKo6JZwzXhpTHxKePgRxZMT55x8Aa8uPb/gHMXS0zx
         WB9A==
X-Gm-Message-State: AOJu0YxLCfYWlKBLGCFJZwfTnJBIcGTPCI7dGWDJg3zqwkDXZiwWg0t5
	BlrKbgZOZ98Z4zPcP+O5QP7ebMSWXqUC
X-Google-Smtp-Source: AGHT+IGsuHQjHdqpdleuPu5UpGMdtR3K+bQ/gAXqTzzWJ4LG9rljjOJgS9dyOlVqTf0oET/QMyj65QGvk/oS
X-Received: from kyletso-p620lin01.ntc.corp.google.com ([2401:fa00:fc:202:99ae:e3b5:518:c5b4])
 (user=kyletso job=sendgmr) by 2002:a25:d7d5:0:b0:d9a:58e1:bb52 with SMTP id
 o204-20020a25d7d5000000b00d9a58e1bb52mr180684ybg.6.1698686035950; Mon, 30 Oct
 2023 10:13:55 -0700 (PDT)
Date: Tue, 31 Oct 2023 01:13:46 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
Message-ID: <20231030171348.600621-1-kyletso@google.com>
Subject: [PATCH v3 0/2] mutiple selectable capabilities in tcpm
From: Kyle Tso <kyletso@google.com>
To: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	linux@roeck-us.net, heikki.krogerus@linux.intel.com, 
	gregkh@linuxfoundation.org
Cc: badhri@google.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	Kyle Tso <kyletso@google.com>
Content-Type: text/plain; charset="UTF-8"

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

 .../bindings/connector/usb-connector.yaml     |  80 ++--
 drivers/usb/typec/tcpm/tcpm.c                 | 389 ++++++++++++++----
 2 files changed, 360 insertions(+), 109 deletions(-)

-- 
2.42.0.820.g83a721a137-goog


