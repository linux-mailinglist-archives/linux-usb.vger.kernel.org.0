Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3FF5C05C4
	for <lists+linux-usb@lfdr.de>; Fri, 27 Sep 2019 14:53:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727170AbfI0MxE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Sep 2019 08:53:04 -0400
Received: from mga18.intel.com ([134.134.136.126]:34429 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725992AbfI0MxE (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 27 Sep 2019 08:53:04 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 27 Sep 2019 05:53:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,555,1559545200"; 
   d="scan'208";a="204155046"
Received: from kuha.fi.intel.com ([10.237.72.53])
  by fmsmga001.fm.intel.com with SMTP; 27 Sep 2019 05:53:01 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 27 Sep 2019 15:53:01 +0300
Date:   Fri, 27 Sep 2019 15:53:01 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Ajay Gupta <ajayg@nvidia.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 00/14] usb: typec: UCSI driver overhaul
Message-ID: <20190927125301.GB23773@kuha.fi.intel.com>
References: <20190926100727.71117-1-heikki.krogerus@linux.intel.com>
 <BYAPR12MB272724AF8ED1C4850FB04230DC810@BYAPR12MB2727.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BYAPR12MB272724AF8ED1C4850FB04230DC810@BYAPR12MB2727.namprd12.prod.outlook.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Sep 27, 2019 at 12:13:57AM +0000, Ajay Gupta wrote:
> Hi Heikki,
> > -----Original Message-----
> > From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > Sent: Thursday, September 26, 2019 3:07 AM
> > To: Ajay Gupta <ajayg@nvidia.com>
> > Cc: linux-usb@vger.kernel.org
> > Subject: [PATCH 00/14] usb: typec: UCSI driver overhaul
> > 
> > Hi Ajay,
> > 
> > Here's the pretty much complete rewrite of the I/O handling that I was
> > talking about. The first seven patches are not actually related to
> > this stuff, but I'm including them here because the rest of the series
> > is made on top of them. I'm including also that fix patch I send you
> > earlier.
> > 
> > After this it should be easier to handle quirks. My idea how to handle
> > the multi-instance connector alt modes is that we "emulate" the PPM in
> > ucsi_ccg.c in order to handle them, so ucsi.c is not touched at all.
> > 
> > We can now get the connector alternate modes that the actual
> > controller supplies during probe - before registering the ucsi
> > interface - and squash all alt modes with the same SVID into one that
> > we supply to the ucsi.c when ever it sends GET_ALTERNATE_MODES
> > command. Also other alt mode commands like SET_NEW_CAM can have
> > special processing in ucsi_ccg.c and ucsi_ccg.c alone. There should
> > not be any problem with that anymore.
> I took the changes and loaded on my GPU system and do not see
> altmode devices under /sys/bus/typec/devices/*. Its empty.
> 
> Below error is seen
> "ucsi_ccg 4-0008: con1: failed to register alternate modes"
> 
> ucsi_run_command() is returning -16.
> 
> I will review the ccg changes and try to debug above issue.

I tested this series with the NVIDIA GPU PCI card that we have. The
controller is reporting BUSY as responce to the GET_ALTERNATE_MODES
command. I added a loop to ucsi_exec_command() where I read the CCI
until the there is no UCSI_CCI_BUSY bit set, and it seems to work.

Here are both changes:

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index accf54d987ad..d70ee8006c34 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -102,6 +102,7 @@ static int ucsi_read_error(struct ucsi *ucsi)

 static int ucsi_exec_command(struct ucsi *ucsi, u64 cmd)
 {
+       unsigned long timeout;
        u32 cci;
        int ret;

@@ -109,12 +110,15 @@ static int ucsi_exec_command(struct ucsi *ucsi, u64 cmd)
        if (ret)
                return ret;

-       ret = ucsi->ops->read(ucsi, UCSI_CCI, &cci, sizeof(cci));
-       if (ret)
-               return ret;
+       timeout = jiffies + msecs_to_jiffies(UCSI_TIMEOUT_MS);
+       do {
+               if (time_is_before_jiffies(timeout))
+                       return -ETIMEDOUT;

-       if (cci & UCSI_CCI_BUSY)
-               return -EBUSY;
+               ret = ucsi->ops->read(ucsi, UCSI_CCI, &cci, sizeof(cci));
+               if (ret)
+                       return ret;
+       } while (cci & UCSI_CCI_BUSY);

        if (!(cci & UCSI_CCI_COMMAND_COMPLETE))
                return -EIO;
@@ -330,7 +334,7 @@ static int ucsi_register_altmodes(struct ucsi_connector *con, u8 recipient)
                command |= UCSI_GET_ALTMODE_RECIPIENT(recipient);
                command |= UCSI_GET_ALTMODE_CONNECTOR_NUMBER(con->num);
                command |= UCSI_GET_ALTMODE_OFFSET(i);
-               command |= UCSI_GET_ALTMODE_NUM_ALTMODES(1); /* One at a time */
+
                len = ucsi_run_command(con->ucsi, command, alt, sizeof(alt));
                if (len <= 0)
                        return len;

Let me know if that works.

thanks,

-- 
heikki
