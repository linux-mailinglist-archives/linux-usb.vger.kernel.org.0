Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC4C94C12B
	for <lists+linux-usb@lfdr.de>; Wed, 19 Jun 2019 21:03:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbfFSTDL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Jun 2019 15:03:11 -0400
Received: from mail-pl1-f181.google.com ([209.85.214.181]:36825 "EHLO
        mail-pl1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726109AbfFSTDL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 19 Jun 2019 15:03:11 -0400
Received: by mail-pl1-f181.google.com with SMTP id k8so206575plt.3
        for <linux-usb@vger.kernel.org>; Wed, 19 Jun 2019 12:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gnarbox-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=uA9hl/cy7clDpvQGIhxKbocc9pYPGpMUjGemP4WZ1m0=;
        b=ezw2I8Md9GUbgk75bkbvfntukrm3+ddtgjLUR/OaeSxYPMTxxBhdv2ojxwoHqKsvt4
         POADdaV0cHCbDOV55B3pbeyn67wmbY8EvD9faYp4n3C/zrx5ZdcZePZXfZ4sJ0IVcWEW
         kiCrXxQ7AA7rcp3OeJRaIalvP9tDKKHs9QLQNjM9XdEWiQNgiKzuY1ActLvZNqlhmlcg
         dQ4kK8ezJJ1c7wY/a+XdBxfnKeUI7MXSZS90z6rsMh0YVFRdKj9yYqnJjWO3D0fSJZ0U
         Z2O1skSvBu7pqXGbNUAZZCmgClPGd/fnkLU812iLTmMFtjaC4OU+2kdafCAfDCfJf3hE
         b04Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=uA9hl/cy7clDpvQGIhxKbocc9pYPGpMUjGemP4WZ1m0=;
        b=L+R9swRzWGDBKOmfXuqmYeKP1y6An2oEjSHtSgSf++ytzn71y8wTFixJ5z1I/C/tsp
         Ut612dAlJJHZrAWsJ8tmNZbypTIU58mi6+5ssHNjS2OGa7Ib8xB0WRn1PA+RmkrhEfqM
         SQjPt5bMZaovRzswR088T4Y49qSg/bJsaF69CvfvEW2kTi2OIc/D0lGC50vBERPM1eCo
         Ua6RoZsq0ubfjOhUQauVlEk3wfBcaQdkA/gceubBmoiatBJmyXXsOs9Vo4onWB+47+Ge
         Oa+X7VbBPImYpeD48QyasPZJo8g/tTKS4tv7LS6holjZcLV99BaXiL621AR2RurmnWr+
         qTgA==
X-Gm-Message-State: APjAAAVSDwCExtVh8HpuhG90DwcYf8eqbbUA/AAMOhbgqRKugQkbNJWW
        jPQaVac9ALzLg/GBgVNlUvSZhjrjEwbYXQ==
X-Google-Smtp-Source: APXvYqzLqZaa2fw/lBMZKap5WVVgoV/cEQcITxL5/ZYSVxaAhxuu+nxx31gj7JiLrgOS/kJh6596xA==
X-Received: by 2002:a17:902:b608:: with SMTP id b8mr23392596pls.303.1560970990067;
        Wed, 19 Jun 2019 12:03:10 -0700 (PDT)
Received: from coops ([12.244.160.210])
        by smtp.gmail.com with ESMTPSA id h12sm6765642pje.12.2019.06.19.12.03.09
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Jun 2019 12:03:09 -0700 (PDT)
Date:   Wed, 19 Jun 2019 12:03:07 -0700
From:   Rob Weber <rob@gnarbox.com>
To:     mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org
Subject: xHCI Driver Compliance Test Support
Message-ID: <20190619190307.GA18466@coops>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Mathias,

I am working on running our custom USB dual-role product through some
compliance testing. It seems that the SoC and host controller are
not responding to the LFPS signaling and timeout that is supposed to
automatically begin the compliance test sequence.

I'm currently running a 4.9.115 kernel, and I'm afraid I might be
missing some critical patches for compliance test support. I noticed
these two patches came up in a google search:

https://patchwork.kernel.org/patch/10415345/
https://www.spinics.net/lists/linux-usb/msg160002.html

Besides these patches, is there anything else that comes to mind that I
might need to do to start compliance testing? I'm about to build a more
recent kernel to see if that improves my situation as well.

Just for reference, our product uses an intel atom z8550 SoC that uses
an xHCI host controller and a dwc3 device controller. Our platform also
uses a USB 3.0 redriver. The datasheet for this redriver (tusb542)
indicates that it's internal LFPS controller supports full USB 3.0
compliance requirements.

Thanks in advance for your guidance!

Cheers,
Rob Weber
