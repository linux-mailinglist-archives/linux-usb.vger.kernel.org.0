Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A843D1186BE
	for <lists+linux-usb@lfdr.de>; Tue, 10 Dec 2019 12:44:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727588AbfLJLoK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Dec 2019 06:44:10 -0500
Received: from mail-pl1-f181.google.com ([209.85.214.181]:35863 "EHLO
        mail-pl1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727562AbfLJLoJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 Dec 2019 06:44:09 -0500
Received: by mail-pl1-f181.google.com with SMTP id d15so502828pll.3
        for <linux-usb@vger.kernel.org>; Tue, 10 Dec 2019 03:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=a+E1VXnHaW9ETW0ZUsF+Cyt0LtM7Ld8+t0OgplDwILk=;
        b=JOYrA7FujFjxwLG1uTXm7LsP5uZHehh8Bq5lvOWs6ZnJYLZ6JNvBDO5C8JS7Xo/zsq
         DDdC9fY5MQDznJgnQsAW2kj4FhU6YB1BDu9AXPbGXwUXfVX+gRIfSba5TAPPXqZO1oqc
         zJNlT9IJvZYiGA5HowKF1WhysctnneX69395CCkLK0aVTqCT1tBico0TmUS07enJ4kgG
         gezzgU0NLcjxerwiNzzDKRK8QWEXYtQds0Lm4Pemr6+ISYY2zNRsJ15a1sZo750N3+OF
         +ig2QSgnNvvGzTkZqfccgDMQBCJ+JKKUfOZ33hpCXLkp0rsqJuhhNUIZoYk81iCRwIam
         fzRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=a+E1VXnHaW9ETW0ZUsF+Cyt0LtM7Ld8+t0OgplDwILk=;
        b=sRu1B4lT60XPeHk8+cFhV3kMZNvceEXicIVO0vevZtf3Wibm4G+SBVYuif2Y0M8e7m
         FGzsmcsKpOWrScBtHM0m2itwSXGVf4qJvj/mzt6s/PmRMEuAZ3y0lNYTBWb64m0pub7R
         6s557y817tembFyq9naIshSLKjoAoYbN/SELnhajh6TVbeu0NNU6Hs6HuycUD+DahmUt
         TpFIdbeLs3LQaewDCC2Q6ZCLftzP99ixwTlAdC8La6AwNVUDZLMRV057AVHcnDTokrBg
         EJ1jMp4RXUq3cubn12cPAF6DFxzC89FbdhaWJduEsTKKkccFJKMnYWz9KYsO31znPXFq
         ijcA==
X-Gm-Message-State: APjAAAUzglFOBDIPGiCMrhA1cktgIBKrq8uEiTMeifrbO8NRVJjJG/O8
        FAPKhv5di9bzw5inPty1Js5kyS0nPETLjTs8
X-Google-Smtp-Source: APXvYqxEYg0/Db7nq317Kow5HyjLHe0xezZFsTmeEfnZ15X9teEFl7QyXqHSgNl3L0mzu12rVAP+Kw==
X-Received: by 2002:a17:902:c693:: with SMTP id r19mr36620627plx.25.1575978248464;
        Tue, 10 Dec 2019 03:44:08 -0800 (PST)
Received: from [0.0.0.0] (vps.kxuan.tech. [67.216.207.230])
        by smtp.gmail.com with ESMTPSA id b21sm3308672pfp.0.2019.12.10.03.44.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2019 03:44:07 -0800 (PST)
To:     Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
From:   Zhai Zhaoxuan <kxuanobj@gmail.com>
Subject: [issue] usbip: vhci-hcd: Device unable to get work after reset
Message-ID: <9b961779-abe7-f6a4-3f2b-f9303ef39c5b@gmail.com>
Date:   Tue, 10 Dec 2019 19:43:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

I am trying to implement a virtual USB device using usbip. But I get a trouble.

When a running port on vhci_hcd is resetted (by setting USB_PORT_FEAT_RESET), it will never be enabled again.

The kernel version is 5.5.0-rc1-00012-g6794862a16ef.
In the source file drivers/usb/usbip/vhci_hcd.c:

  565         case USB_PORT_FEAT_RESET:
...
  572             /* if it's already enabled, disable */
  573             if (hcd->speed == HCD_USB3) {
  574                 vhci_hcd->port_status[rhport] = 0;
  575                 vhci_hcd->port_status[rhport] =
  576                     (USB_SS_PORT_STAT_POWER |
  577                      USB_PORT_STAT_CONNECTION |
  578                      USB_PORT_STAT_RESET);
  579             } else if (vhci_hcd->port_status[rhport] & USB_PORT_STAT_ENABLE) {
  580                 vhci_hcd->port_status[rhport] &= ~(USB_PORT_STAT_ENABLE
  581                     | USB_PORT_STAT_LOW_SPEED
  582                     | USB_PORT_STAT_HIGH_SPEED);
  583             }
  584

The USB_PORT_STAT_ENABLE is cleard. And it should be set later.
But, the GetPortStatus only set the USB_PORT_STAT_ENABLE for not-assigned ports.

  430     case GetPortStatus:
...
  456             if (vhci_hcd->vdev[rhport].ud.status ==
  457                 VDEV_ST_NOTASSIGNED) {
  458                 usbip_dbg_vhci_rh(
  459                     " enable rhport %d (status %u)\n",
  460                     rhport,
  461                     vhci_hcd->vdev[rhport].ud.status);
  462                 vhci_hcd->port_status[rhport] |=
  463                     USB_PORT_STAT_ENABLE;
  464             }

The used port (status == VDEV_ST_USED) will be disabled after USB_PORT_FEAT_RESET, and unable to be enabled again.

Should VDEV_ST_USED be added to line 457?
And if it shouldn't, how can I enable a port after USB_PORT_FEAT_RESET?


Thanks,
Zhai Zhaoxuan

