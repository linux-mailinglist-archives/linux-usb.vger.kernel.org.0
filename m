Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C16C1D8409
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2019 00:48:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390115AbfJOWsj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Oct 2019 18:48:39 -0400
Received: from mail1.bemta26.messagelabs.com ([85.158.142.3]:39171 "EHLO
        mail1.bemta26.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725991AbfJOWsi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Oct 2019 18:48:38 -0400
Received: from [85.158.142.101] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-3.bemta.az-a.eu-central-1.aws.symcld.net id 45/B2-25878-2CC46AD5; Tue, 15 Oct 2019 22:48:34 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprDKsWRWlGSWpSXmKPExsWi9O35Q91DPst
  iDWb2K1ssWtbK7MDo8XmTXABjFGtmXlJ+RQJrxuSrH9gK3vFX7Lr/lamBcRpvFyMnh5DAZEaJ
  130pXYxcHCwCK1gl5s9rZARxJAT2sUpsnf0HytnEJHFx91KmLkYOIKdaYvvuaJBuCYE0iaNXJ
  zNB2NUSC/+0MkJMVZE413OFDcJezCSx5lYliM0r4Cqx9EUjM4gtLKAt0XhyL1gvm4CWxOKpDe
  wgtoiArMThK7/BalgEVCXOzf0JFucUcJOY1LsGar6rxLxNa1lAbGYBTYnW7b/BakSBeqft7mO
  B2CUocXLmE6gaeYnmrbOZIe6UlThw8jvUzZISB1fcYIGwbSQu7brJOoFRfBaSsbOQjJqFZNQC
  RuZVjJZJRZnpGSW5iZk5uoYGBrqGhsa6RrqG5sZ6iVW6iXqppbrJqXklRYlAWb3E8mK94src5
  JwUvbzUkk2MwEhLKWRau4Nx/qw3eocYJTmYlER5fZ4sjRXiS8pPqcxILM6ILyrNSS0+xCjDwa
  EkwbvWbVmskGBRanpqRVpmDjDqYdISHDxKIrxTvYHSvMUFibnFmekQqVOMilLivEnAVCEkAJL
  IKM2Da4MlmkuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHmdQabwZOaVwE1/BbSYCWhxoP5i
  kMUliQgpqQYmjsBPjIc/yJ/7HB9wTiJjqmSbzpGtggVP1YLObHA5sPNPT0OLuOGkunWbv774y
  9/itFapsIolrufATI+ulRf4vEXEbVvYms1UJizSfaRh2TI9yE3WKVjfYesVu4B3GxijPjL+M+
  lojjdOqgy4KHrM5PfHtl1CqS6MNn4L8uslb5Z2WXP7mE7SVr4smTabgTOiOlCAWS3t84lVPgl
  a9YZBN38cEmIM/7/5fuH8f582xid+S+PiVFz7KqMuQmQj23a/aVUMF3S618l+fGQpc9mA9Vj6
  qwslW7qniTCwRAmWbUwuvn8lSPhi1f49ASvXxF5huBnyV79kY9zlRIsQ1sscH3o8oxgjr659O
  jG0XomlOCPRUIu5qDgRAHv1jRyvAwAA
X-Env-Sender: marc.fauvain@bbva.com
X-Msg-Ref: server-19.tower-226.messagelabs.com!1571179714!146825!1
X-Originating-IP: [34.246.231.225]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.12; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3129 invoked from network); 15 Oct 2019 22:48:34 -0000
Received: from p11b.mail.dlp.protect.symantec.com (HELO mail.ds.dlp.protect.symantec.com) (34.246.231.225)
  by server-19.tower-226.messagelabs.com with ECDHE-RSA-AES256-SHA384 encrypted SMTP; 15 Oct 2019 22:48:34 -0000
Received: by mail-ot1-f69.google.com with SMTP id r5so10140482otn.22
        for <linux-usb@vger.kernel.org>; Tue, 15 Oct 2019 15:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bbva.com; s=google-bbva-com;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=vjZcEM6GHH0iKo8jRGL2BkG0bCWCpaqiBvZ95qz878U=;
        b=YD73q3OUMD5bUqU5D8j0SPH75i306pe+F4e7f5ewbZsCdT4LE9/Vg8ltiG2l7bOmUC
         DSQiMHxsoNDxtpxaJwFVblM92+eP1aDMdSqvH8uHzWkiNhLeDSWZ86ZyjCo50mYhECYj
         6f2FJIC9lrYMEMPs0IBWoVrklg2pL7+aDmMfr4u/ZEBNjtTSjKReckSMQfI62iegAxJx
         SXULnjXqSBtaWJVsEMLBUxVmV3ghTI7cNhqBpy9/nstv0gobMPv5T+tVy6pIpLLJOoke
         jj7Xzy/X/d6ssquDpOlQsTLj5jcF7CTEhfoqJUcA4k8uSLXO7kVCAj8VGQuB4l9NCyLh
         jEoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=vjZcEM6GHH0iKo8jRGL2BkG0bCWCpaqiBvZ95qz878U=;
        b=BQOfg49IvCnjxOjMSCB18KFJZpl54oKfaeoWEVdam1P942L9eBcrg03ySdtafYANVz
         biOXWFvg7UcHhWd/dhq9bWpMYppzovCTNLcGyQ6bFv/EVgREBFREwCdXfSBj2PVrp6gx
         I6Yd+YW+a3cBxSor6ehr31KoqgqXY4kiJ/BjkzX5+mTlE0WPy+TJDvX0KJIKT1JnGiK1
         OuBsO0hGumAaxCmeSxt3G0bRgXOWTL8ETKe8rOZ45kvE/ykQoL82NUnWda7vjI9D6hxM
         Qh+G00T0yPznRxRW7OEIL4sdmVg6exwS8wA5HiH+iX48smLloIRvkYW3S6K0tb/tBGhT
         sSsQ==
X-Gm-Message-State: APjAAAUxGdCEywgbukRkKlaaXLuGJgbpbEUKddI+yOB9Gu5GpFbJVu6t
        mjacrOvWxCectLYsihD0aCjgu2cW8yJF42TEqTzzkgQpt5BUrm5fkyB7a44fzH2r5Xf1T3qnehQ
        GS7TCYxhqxaJKP30x4NiGzvIrtGKZGJikerdtegFJHagqqeYb9TtAI72jIvkaZvUUHcMzP6p+Nz
        1YZN5cZSNwWlntyfDHabRdHKJ0EHpoQNf2GUzSqBy7BYo297Sr5RssnbAZ+OaCV5unQrXNMQ==
X-Received: by 2002:a9d:1d2:: with SMTP id e76mr32562470ote.30.1571179711817;
        Tue, 15 Oct 2019 15:48:31 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz6NsNm0eXRF9g6SoB+0K3qj14YFlwV0wfKZVCjwiUjg3Y1C9RdhuS9mJxFmYUutrLtnhneog==
X-Received: by 2002:a9d:1d2:: with SMTP id e76mr32562432ote.30.1571179711019;
        Tue, 15 Oct 2019 15:48:31 -0700 (PDT)
Received: from LightBook.localdomain ([189.236.36.180])
        by smtp.gmail.com with ESMTPSA id o21sm6662314otp.24.2019.10.15.15.48.29
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 15:48:30 -0700 (PDT)
Message-ID: <9c86b787f94fbd6420b7dcd554b27b06c302e78f.camel@bbva.com>
Subject: Re: USB-C dock ethernet port issue
From:   Marc Fauvain <marc.fauvain@bbva.com>
To:     linux-usb@vger.kernel.org
Date:   Tue, 15 Oct 2019 17:48:28 -0500
In-Reply-To: <4de35a5de7906cfa54de6eb4c5236daa05e6fdf3.camel@bbva.com>
References: <4de35a5de7906cfa54de6eb4c5236daa05e6fdf3.camel@bbva.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-dl-symantec-google: from-mx
X-CFilter-Loop: Reflected
X-DetectorID-Processed: 626c2525-8c57-41e8-9537-107a9b50c1ee
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

with extract from dmesg :

usb 4-2-port3: Cannot enable. Maybe the USB cable is bad?
usb 4-2-port3: Cannot enable. Maybe the USB cable is bad?
usb 1-8.3: new high-speed USB device number 26 using xhci_hcd
usb 4-2-port3: Cannot enable. Maybe the USB cable is bad?
usb 4-2-port3: Cannot enable. Maybe the USB cable is bad?
usb 1-8.3: new high-speed USB device number 27 using xhci_hcd
usb 1-8.3: Device not responding to setup address.
usb 1-8.3: Device not responding to setup address.
usb 1-8.3: device not accepting address 27, error -71

-- 
BBVA

Marc Fauvain

Head of Equity Trading Americas - Managing Director

Tel. +52 55 5621 9831  Cel. +52 1 55 3755 0028

Corporate & Investment Banking - México D.F.



-----Original Message-----
From: Marc Fauvain <marc.fauvain@bbva.com>
To: linux-usb@vger.kernel.org
Subject: USB-C dock ethernet port issue
Date: Tue, 15 Oct 2019 17:35:14 -0500

Not specific to a kernel version as I've been seeing the bug since
kernel 4.8. When connecting a macbookpro 14,1 to a USB dock (from
Pluggable) with Ethernet, USB and Audio via provided (Pluggable) USB-C
cable, Ethernet port is not always recognized with provided dmesg.

Strange because when connecting to the dock with an Apple USB-C cable,
ethernet port is always recognized, however with a different  name
`enp0s20f0u8u3`. With Pluggable USB-C cable I tried to power cycle the
dock and `sudo lsusb -c` to no avail. Ethernet port was not recognized
anymore.
I recently upgraded to kernel 5.2.14, turned off/on the dock, and ran
`sudo lsusb -v`, Ethernet port magically appeared (with Pluggable USB-
C 
cable) however with `enp0s20f0u8u3` name and not `enp7s0u2u3` as
before. There seem to have some instability when setting USB connection
at some point.

Back after a few weeks, just after power failure, ethernet port is not
recognized anymore. running kernel 5.3.5 now. sudo lsusb -v now does
not do any magic. ethernet port stay unrecognized and dmesg shows 'usb
4-2-port3: Cannot enable. Maybe the USB cable is bad?'..

Regards


