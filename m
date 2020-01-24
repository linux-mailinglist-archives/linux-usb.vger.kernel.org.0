Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3495148521
	for <lists+linux-usb@lfdr.de>; Fri, 24 Jan 2020 13:26:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731476AbgAXM0T (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Jan 2020 07:26:19 -0500
Received: from mail-io1-f50.google.com ([209.85.166.50]:45369 "EHLO
        mail-io1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730535AbgAXM0T (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Jan 2020 07:26:19 -0500
Received: by mail-io1-f50.google.com with SMTP id i11so1639422ioi.12
        for <linux-usb@vger.kernel.org>; Fri, 24 Jan 2020 04:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=7MzVSdT06QIa04Hu9w/Z1iFlayTsxN6xp9kVfWchjSw=;
        b=u7CYc7l2IprCKGLDeV6s/uaGVmaZhc1AjozKUG3WDWa3jrUUHHfsp6tNO2MdAgzaW6
         zzCEqBeTAnbtbZ06L+ENcwjCZ7Dp1f4BvRqMEFmCMh3aU8WotRaniS6byop344w/ty+k
         7kjNxWB94OZu/6BItBSTpPG3utCtSgd9OwsoIskA9Hw+FwcquQYU/Z+NFyf1ER3PEo1p
         MQsckS8vWAHFxggimdzRy+AvhUrAZoMsjzml4uVLOPFsn9IFN6BqhWhXjhkS+ta/2/BL
         vON6K0rPW6JZzHCDWyOtANazb2N1MqzW4CUDjGnYb4jHR3ML2gXFvOx3Il3QWv2/jYkm
         FV3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=7MzVSdT06QIa04Hu9w/Z1iFlayTsxN6xp9kVfWchjSw=;
        b=CnG7YXeSbJY3AhnIbmDXNyxPzqNwgIvlRhPCOXeHCMOl0kL2QpWOEtBM/1I/7E7NfL
         2npPMUxL9hQnGb884+6GppjtQcAFkhyfM0KwG7l7BPXMQUEXcrRPdBj58LJ+Z4ffwS/r
         15hM2oYlykBCmZwZCl1UuprcekyMcg+Wv1RhI9qzgAD+VOZ6mSjkZhkm0DTQ5SFHuzoo
         3SYTOg97QASbL0FwTZV12vyeMACvPtc/mi/e/DjiakEweJoNTFsEIE0mmr1z7cqqwVG0
         fEXzzbzaYeqmw5JMbb+nxvJLOw1m3hcXRdjBIl/ZrbcNZBpk7DcDj8khylrL1QkdvnUm
         +c3w==
X-Gm-Message-State: APjAAAUwKP7RIQLPR6DZ3RC2cFDnkEA5OrK465U/dv+tSNn1UHU6CNKZ
        GFdCVTVybhynJIs14giixGaQGfdj130CsJl97HYfTX3D
X-Google-Smtp-Source: APXvYqzLFD6bvOiplfc3Y28mCT53lGLsI8tvCL30xXB2UKyxMzDngUoXPM63MqorEKWjOeO8AgcFuGPtLld15FFzndc=
X-Received: by 2002:a02:2a8e:: with SMTP id w136mr2253228jaw.117.1579868778791;
 Fri, 24 Jan 2020 04:26:18 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ad5:5d0d:0:0:0:0:0 with HTTP; Fri, 24 Jan 2020 04:26:18
 -0800 (PST)
From:   JH <jupiter.hce@gmail.com>
Date:   Fri, 24 Jan 2020 23:26:18 +1100
Message-ID: <CAA=hcWSKCryEZVhWptN9iz1dbh_4rMNp0X1LMop0SA7LjYWRVQ@mail.gmail.com>
Subject: qmi_wwan error
To:     linux-usb <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

I am running kernel 4.19.75 on iMX6 with a uBlox SARA-R4 LTE modem,
the modem manager is oFono, connect manager is connman. It could
connect to LTE between half hours to hours, then it dropped LTE
connection randomly, here are error messages, what could cause the
qmi_wwan status received: -71 and qmi_wwan usb_submit_urb failed with
result -19 errors?

[ 1018.944840] usb 1-1: USB disconnect, device number 2
[ 1019.072845] option1 ttyUSB0: GSM modem (1-port) converter now
disconnected from ttyUSB0
[ 1019.130834] option 1-1:1.0: device disconnected
[ 1019.142012] qmi_wwan 1-1:1.3: nonzero urb status received: -71
[ 1019.147909] qmi_wwan 1-1:1.3: wdm_int_callback - 0 bytes
[ 1019.153254] qmi_wwan 1-1:1.3: wdm_int_callback - usb_submit_urb
failed with result -19
[ 1019.228197] option1 ttyUSB1: GSM modem (1-port) converter now
disconnected from ttyUSB1
[ 1019.274475] option 1-1:1.2: device disconnected
[ 1019.340442] qmi_wwan 1-1:1.3 wwan0: unregister 'qmi_wwan'
usb-ci_hdrc.1-1, WWAN/QMI device
[ 1022.827992] usb 1-1: new high-speed USB device number 3 using ci_hdrc
[ 1023.057165] option 1-1:1.0: GSM modem (1-port) converter detected
[ 1023.097815] usb 1-1: GSM modem (1-port) converter now attached to ttyUSB0
[ 1023.157293] option 1-1:1.2: GSM modem (1-port) converter detected
[ 1023.178163] usb 1-1: GSM modem (1-port) converter now attached to ttyUSB1
[ 1023.201251] qmi_wwan 1-1:1.3: cdc-wdm0: USB WDM device
[ 1023.243783] qmi_wwan 1-1:1.3 wwan0: register 'qmi_wwan' at
usb-ci_hdrc.1-1, WWAN/QMI device, 16:ed:38:aa:c5:90

Thank you.

Kind regards,

- jh
