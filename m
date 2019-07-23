Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26D1F70F7B
	for <lists+linux-usb@lfdr.de>; Tue, 23 Jul 2019 05:03:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732269AbfGWDDi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Jul 2019 23:03:38 -0400
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:55411 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729393AbfGWDDh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 22 Jul 2019 23:03:37 -0400
X-IronPort-AV: E=Sophos;i="5.64,297,1559512800"; 
   d="scan'208";a="392913135"
Received: from c-73-22-29-55.hsd1.il.comcast.net (HELO hadrien) ([73.22.29.55])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Jul 2019 05:03:24 +0200
Date:   Mon, 22 Jul 2019 22:03:22 -0500 (CDT)
From:   Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: jll@hadrien
To:     mirq-linux@rere.qmqm.pl
cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ladislav Michl <ladis@linux-mips.org>,
        linux-usb@vger.kernel.org, kbuild-all@01.org
Subject: Re: [PATCH v4 4/6] usb: gadget: u_serial: allow more console gadget
 ports (fwd)
Message-ID: <alpine.DEB.2.21.1907222201140.2555@hadrien>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

Should the out: label be moved up one line?

julia

---------- Forwarded message ----------
Date: Tue, 23 Jul 2019 10:54:22 +0800
From: kbuild test robot <lkp@intel.com>
To: kbuild@01.org
Cc: Julia Lawall <julia.lawall@lip6.fr>
Subject: Re: [PATCH v4 4/6] usb: gadget: u_serial: allow more console gadget
    ports

CC: kbuild-all@01.org
In-Reply-To: <0f82c726dcf2d4c7819a7ccfb7be250b031884f7.1563808218.git.mirq-linux@rere.qmqm.pl>
References: <0f82c726dcf2d4c7819a7ccfb7be250b031884f7.1563808218.git.mirq-linux@rere.qmqm.pl>
TO: "Micha?? Miros??aw" <mirq-linux@rere.qmqm.pl>
CC: linux-usb@vger.kernel.org
CC: Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ladislav Michl <ladis@linux-mips.org>

Hi "Micha??,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[cannot apply to v5.3-rc1 next-20190722]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Micha-Miros-aw/usb-gadget-u_serial-console-improvements/20190723-084448
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>

>> drivers/usb/gadget/function/u_serial.c:1128:1-7: preceding lock on line 1118

# https://github.com/0day-ci/linux/commit/a4ada1ad2a00fcc75fb461bd7733cb02c74bdd39
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout a4ada1ad2a00fcc75fb461bd7733cb02c74bdd39
vim +1128 drivers/usb/gadget/function/u_serial.c

a4ada1ad2a00fcc drivers/usb/gadget/function/u_serial.c Micha?? Miros??aw           2019-07-22  1112
a4ada1ad2a00fcc drivers/usb/gadget/function/u_serial.c Micha?? Miros??aw           2019-07-22  1113  ssize_t gserial_get_console(unsigned char port_num, char *page)
a4ada1ad2a00fcc drivers/usb/gadget/function/u_serial.c Micha?? Miros??aw           2019-07-22  1114  {
a4ada1ad2a00fcc drivers/usb/gadget/function/u_serial.c Micha?? Miros??aw           2019-07-22  1115  	struct gs_port *port;
a4ada1ad2a00fcc drivers/usb/gadget/function/u_serial.c Micha?? Miros??aw           2019-07-22  1116  	ssize_t ret = -ENXIO;
a4ada1ad2a00fcc drivers/usb/gadget/function/u_serial.c Micha?? Miros??aw           2019-07-22  1117
a4ada1ad2a00fcc drivers/usb/gadget/function/u_serial.c Micha?? Miros??aw           2019-07-22 @1118  	mutex_lock(&ports[port_num].lock);
a4ada1ad2a00fcc drivers/usb/gadget/function/u_serial.c Micha?? Miros??aw           2019-07-22  1119  	port = ports[port_num].port;
a4ada1ad2a00fcc drivers/usb/gadget/function/u_serial.c Micha?? Miros??aw           2019-07-22  1120
a4ada1ad2a00fcc drivers/usb/gadget/function/u_serial.c Micha?? Miros??aw           2019-07-22  1121  	if (WARN_ON(port == NULL))
a4ada1ad2a00fcc drivers/usb/gadget/function/u_serial.c Micha?? Miros??aw           2019-07-22  1122  		goto out;
a4ada1ad2a00fcc drivers/usb/gadget/function/u_serial.c Micha?? Miros??aw           2019-07-22  1123
a4ada1ad2a00fcc drivers/usb/gadget/function/u_serial.c Micha?? Miros??aw           2019-07-22  1124  	ret = sprintf(page, "%u\n", !!port->console);
a4ada1ad2a00fcc drivers/usb/gadget/function/u_serial.c Micha?? Miros??aw           2019-07-22  1125
a4ada1ad2a00fcc drivers/usb/gadget/function/u_serial.c Micha?? Miros??aw           2019-07-22  1126  	mutex_unlock(&ports[port_num].lock);
a4ada1ad2a00fcc drivers/usb/gadget/function/u_serial.c Micha?? Miros??aw           2019-07-22  1127  out:
a4ada1ad2a00fcc drivers/usb/gadget/function/u_serial.c Micha?? Miros??aw           2019-07-22 @1128  	return ret;
a4ada1ad2a00fcc drivers/usb/gadget/function/u_serial.c Micha?? Miros??aw           2019-07-22  1129  }
a4ada1ad2a00fcc drivers/usb/gadget/function/u_serial.c Micha?? Miros??aw           2019-07-22  1130  EXPORT_SYMBOL_GPL(gserial_get_console);
a4ada1ad2a00fcc drivers/usb/gadget/function/u_serial.c Micha?? Miros??aw           2019-07-22  1131
a5beaaf39455e43 drivers/usb/gadget/function/u_serial.c Baolin Wang               2015-11-21  1132  #else
a5beaaf39455e43 drivers/usb/gadget/function/u_serial.c Baolin Wang               2015-11-21  1133
e273a647995aac7 drivers/usb/gadget/function/u_serial.c Micha?? Miros??aw           2019-07-22  1134  static int gs_console_connect(struct gs_port *port)
a5beaaf39455e43 drivers/usb/gadget/function/u_serial.c Baolin Wang               2015-11-21  1135  {
a5beaaf39455e43 drivers/usb/gadget/function/u_serial.c Baolin Wang               2015-11-21  1136  	return 0;
a5beaaf39455e43 drivers/usb/gadget/function/u_serial.c Baolin Wang               2015-11-21  1137  }
a5beaaf39455e43 drivers/usb/gadget/function/u_serial.c Baolin Wang               2015-11-21  1138
e273a647995aac7 drivers/usb/gadget/function/u_serial.c Micha?? Miros??aw           2019-07-22  1139  static void gs_console_disconnect(struct gs_port *port)
a5beaaf39455e43 drivers/usb/gadget/function/u_serial.c Baolin Wang               2015-11-21  1140  {
a5beaaf39455e43 drivers/usb/gadget/function/u_serial.c Baolin Wang               2015-11-21  1141  }
a5beaaf39455e43 drivers/usb/gadget/function/u_serial.c Baolin Wang               2015-11-21  1142
e273a647995aac7 drivers/usb/gadget/function/u_serial.c Micha?? Miros??aw           2019-07-22  1143  static int gs_console_init(struct gs_port *port)
a5beaaf39455e43 drivers/usb/gadget/function/u_serial.c Baolin Wang               2015-11-21  1144  {
e273a647995aac7 drivers/usb/gadget/function/u_serial.c Micha?? Miros??aw           2019-07-22  1145  	return -ENOSYS;
a5beaaf39455e43 drivers/usb/gadget/function/u_serial.c Baolin Wang               2015-11-21  1146  }
a5beaaf39455e43 drivers/usb/gadget/function/u_serial.c Baolin Wang               2015-11-21  1147
e273a647995aac7 drivers/usb/gadget/function/u_serial.c Micha?? Miros??aw           2019-07-22  1148  static void gs_console_exit(struct gs_port *port)
a5beaaf39455e43 drivers/usb/gadget/function/u_serial.c Baolin Wang               2015-11-21  1149  {
a5beaaf39455e43 drivers/usb/gadget/function/u_serial.c Baolin Wang               2015-11-21  1150  }
a5beaaf39455e43 drivers/usb/gadget/function/u_serial.c Baolin Wang               2015-11-21  1151
a5beaaf39455e43 drivers/usb/gadget/function/u_serial.c Baolin Wang               2015-11-21  1152  #endif
a5beaaf39455e43 drivers/usb/gadget/function/u_serial.c Baolin Wang               2015-11-21  1153
c3c04b2945eccd8 drivers/usb/gadget/u_serial.c          Benoit Goby               2012-05-10  1154  static int
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1155  gs_port_alloc(unsigned port_num, struct usb_cdc_line_coding *coding)
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1156  {
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1157  	struct gs_port	*port;
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1158  	int		ret = 0;
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1159
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1160  	mutex_lock(&ports[port_num].lock);
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1161  	if (ports[port_num].port) {
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1162  		ret = -EBUSY;
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1163  		goto out;
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1164  	}
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1165
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1166  	port = kzalloc(sizeof(struct gs_port), GFP_KERNEL);
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1167  	if (port == NULL) {
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1168  		ret = -ENOMEM;
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1169  		goto out;
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1170  	}
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1171
266e37efbc28b05 drivers/usb/gadget/u_serial.c          Jiri Slaby                2012-04-02  1172  	tty_port_init(&port->port);
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1173  	spin_lock_init(&port->port_lock);
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1174  	init_waitqueue_head(&port->drain_wait);
b140dfe622ca23b drivers/usb/gadget/function/u_serial.c Peter Hurley              2015-10-10  1175  	init_waitqueue_head(&port->close_wait);
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1176
8b4c62aef6f611d drivers/usb/gadget/function/u_serial.c Micha?? Miros??aw           2018-12-16  1177  	INIT_DELAYED_WORK(&port->push, gs_rx_push);
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1178
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1179  	INIT_LIST_HEAD(&port->read_pool);
937ef73d5075997 drivers/usb/gadget/u_serial.c          David Brownell            2008-07-07  1180  	INIT_LIST_HEAD(&port->read_queue);
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1181  	INIT_LIST_HEAD(&port->write_pool);
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1182
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1183  	port->port_num = port_num;
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1184  	port->port_line_coding = *coding;
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1185
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1186  	ports[port_num].port = port;
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1187  out:
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1188  	mutex_unlock(&ports[port_num].lock);
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1189  	return ret;
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1190  }
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1191
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1192  static int gs_closed(struct gs_port *port)
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1193  {
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1194  	int cond;
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1195
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1196  	spin_lock_irq(&port->port_lock);
266e37efbc28b05 drivers/usb/gadget/u_serial.c          Jiri Slaby                2012-04-02  1197  	cond = (port->port.count == 0) && !port->openclose;
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1198  	spin_unlock_irq(&port->port_lock);
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1199  	return cond;
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1200  }
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1201
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1202  static void gserial_free_port(struct gs_port *port)
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1203  {
8b4c62aef6f611d drivers/usb/gadget/function/u_serial.c Micha?? Miros??aw           2018-12-16  1204  	cancel_delayed_work_sync(&port->push);
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1205  	/* wait for old opens to finish */
b140dfe622ca23b drivers/usb/gadget/function/u_serial.c Peter Hurley              2015-10-10  1206  	wait_event(port->close_wait, gs_closed(port));
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1207  	WARN_ON(port->port_usb != NULL);
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1208  	tty_port_destroy(&port->port);
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1209  	kfree(port);
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1210  }
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1211
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1212  void gserial_free_line(unsigned char port_num)
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1213  {
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1214  	struct gs_port	*port;
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1215
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1216  	mutex_lock(&ports[port_num].lock);
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1217  	if (WARN_ON(!ports[port_num].port)) {
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1218  		mutex_unlock(&ports[port_num].lock);
ac90e36592ea517 drivers/usb/gadget/u_serial.c          David Brownell            2008-07-01  1219  		return;
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1220  	}
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1221  	port = ports[port_num].port;
e273a647995aac7 drivers/usb/gadget/function/u_serial.c Micha?? Miros??aw           2019-07-22  1222  	gs_console_exit(port);
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1223  	ports[port_num].port = NULL;
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1224  	mutex_unlock(&ports[port_num].lock);
ac90e36592ea517 drivers/usb/gadget/u_serial.c          David Brownell            2008-07-01  1225
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1226  	gserial_free_port(port);
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1227  	tty_unregister_device(gs_tty_driver, port_num);
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1228  }
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1229  EXPORT_SYMBOL_GPL(gserial_free_line);
937ef73d5075997 drivers/usb/gadget/u_serial.c          David Brownell            2008-07-07  1230
816831c26b5158e drivers/usb/gadget/function/u_serial.c Micha?? Miros??aw           2019-07-22  1231  int gserial_alloc_line_no_console(unsigned char *line_num)
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1232  {
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1233  	struct usb_cdc_line_coding	coding;
e273a647995aac7 drivers/usb/gadget/function/u_serial.c Micha?? Miros??aw           2019-07-22  1234  	struct gs_port			*port;
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1235  	struct device			*tty_dev;
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1236  	int				ret;
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1237  	int				port_num;
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1238
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1239  	coding.dwDTERate = cpu_to_le32(9600);
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1240  	coding.bCharFormat = 8;
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1241  	coding.bParityType = USB_CDC_NO_PARITY;
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1242  	coding.bDataBits = USB_CDC_1_STOP_BITS;
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1243
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1244  	for (port_num = 0; port_num < MAX_U_SERIAL_PORTS; port_num++) {
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1245  		ret = gs_port_alloc(port_num, &coding);
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1246  		if (ret == -EBUSY)
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1247  			continue;
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1248  		if (ret)
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1249  			return ret;
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1250  		break;
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1251  	}
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1252  	if (ret)
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1253  		return ret;
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1254
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1255  	/* ... and sysfs class devices, so mdev/udev make /dev/ttyGS* */
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1256
e273a647995aac7 drivers/usb/gadget/function/u_serial.c Micha?? Miros??aw           2019-07-22  1257  	port = ports[port_num].port;
e273a647995aac7 drivers/usb/gadget/function/u_serial.c Micha?? Miros??aw           2019-07-22  1258  	tty_dev = tty_port_register_device(&port->port,
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1259  			gs_tty_driver, port_num, NULL);
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1260  	if (IS_ERR(tty_dev)) {
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1261  		pr_err("%s: failed to register tty for port %d, err %ld\n",
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1262  				__func__, port_num, PTR_ERR(tty_dev));
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1263
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1264  		ret = PTR_ERR(tty_dev);
5586af934be6dec drivers/usb/gadget/function/u_serial.c Micha?? Miros??aw           2019-07-22  1265  		mutex_lock(&ports[port_num].lock);
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1266  		ports[port_num].port = NULL;
5586af934be6dec drivers/usb/gadget/function/u_serial.c Micha?? Miros??aw           2019-07-22  1267  		mutex_unlock(&ports[port_num].lock);
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1268  		gserial_free_port(port);
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1269  		goto err;
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1270  	}
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1271  	*line_num = port_num;
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1272  err:
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1273  	return ret;
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1274  }
816831c26b5158e drivers/usb/gadget/function/u_serial.c Micha?? Miros??aw           2019-07-22  1275  EXPORT_SYMBOL_GPL(gserial_alloc_line_no_console);
816831c26b5158e drivers/usb/gadget/function/u_serial.c Micha?? Miros??aw           2019-07-22  1276
816831c26b5158e drivers/usb/gadget/function/u_serial.c Micha?? Miros??aw           2019-07-22  1277  int gserial_alloc_line(unsigned char *line_num)
816831c26b5158e drivers/usb/gadget/function/u_serial.c Micha?? Miros??aw           2019-07-22  1278  {
816831c26b5158e drivers/usb/gadget/function/u_serial.c Micha?? Miros??aw           2019-07-22  1279  	int ret = gserial_alloc_line_no_console(line_num);
816831c26b5158e drivers/usb/gadget/function/u_serial.c Micha?? Miros??aw           2019-07-22  1280
816831c26b5158e drivers/usb/gadget/function/u_serial.c Micha?? Miros??aw           2019-07-22  1281  	if (!ret && !*line_num)
816831c26b5158e drivers/usb/gadget/function/u_serial.c Micha?? Miros??aw           2019-07-22  1282  		gs_console_init(ports[*line_num].port);
816831c26b5158e drivers/usb/gadget/function/u_serial.c Micha?? Miros??aw           2019-07-22  1283
816831c26b5158e drivers/usb/gadget/function/u_serial.c Micha?? Miros??aw           2019-07-22  1284  	return ret;
816831c26b5158e drivers/usb/gadget/function/u_serial.c Micha?? Miros??aw           2019-07-22  1285  }
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1286  EXPORT_SYMBOL_GPL(gserial_alloc_line);
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1287
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1288  /**
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1289   * gserial_connect - notify TTY I/O glue that USB link is active
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1290   * @gser: the function, set up with endpoints and descriptors
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1291   * @port_num: which port is active
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1292   * Context: any (usually from irq)
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1293   *
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1294   * This is called activate endpoints and let the TTY layer know that
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1295   * the connection is active ... not unlike "carrier detect".  It won't
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1296   * necessarily start I/O queues; unless the TTY is held open by any
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1297   * task, there would be no point.  However, the endpoints will be
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1298   * activated so the USB host can perform I/O, subject to basic USB
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1299   * hardware flow control.
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1300   *
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1301   * Caller needs to have set up the endpoints and USB function in @dev
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1302   * before calling this, as well as the appropriate (speed-specific)
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1303   * endpoint descriptors, and also have allocate @port_num by calling
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1304   * @gserial_alloc_line().
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1305   *
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1306   * Returns negative errno or zero.
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1307   * On success, ep->driver_data will be overwritten.
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1308   */
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1309  int gserial_connect(struct gserial *gser, u8 port_num)
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1310  {
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1311  	struct gs_port	*port;
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1312  	unsigned long	flags;
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1313  	int		status;
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1314
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1315  	if (port_num >= MAX_U_SERIAL_PORTS)
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1316  		return -ENXIO;
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1317
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1318  	port = ports[port_num].port;
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1319  	if (!port) {
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1320  		pr_err("serial line %d not allocated.\n", port_num);
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1321  		return -EINVAL;
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1322  	}
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1323  	if (port->port_usb) {
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1324  		pr_err("serial line %d is in use.\n", port_num);
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1325  		return -EBUSY;
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1326  	}
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1327
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1328  	/* activate the endpoints */
72c973dd2b01b21 drivers/usb/gadget/u_serial.c          Tatyana Brokhman          2011-06-28  1329  	status = usb_ep_enable(gser->in);
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1330  	if (status < 0)
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1331  		return status;
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1332  	gser->in->driver_data = port;
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1333
72c973dd2b01b21 drivers/usb/gadget/u_serial.c          Tatyana Brokhman          2011-06-28  1334  	status = usb_ep_enable(gser->out);
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1335  	if (status < 0)
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1336  		goto fail_out;
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1337  	gser->out->driver_data = port;
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1338
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1339  	/* then tell the tty glue that I/O can work */
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1340  	spin_lock_irqsave(&port->port_lock, flags);
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1341  	gser->ioport = port;
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1342  	port->port_usb = gser;
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1343
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1344  	/* REVISIT unclear how best to handle this state...
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1345  	 * we don't really couple it with the Linux TTY.
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1346  	 */
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1347  	gser->port_line_coding = port->port_line_coding;
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1348
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1349  	/* REVISIT if waiting on "carrier detect", signal. */
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1350
1f1ba11b6494705 drivers/usb/gadget/u_serial.c          David Brownell            2008-08-06  1351  	/* if it's already open, start I/O ... and notify the serial
1f1ba11b6494705 drivers/usb/gadget/u_serial.c          David Brownell            2008-08-06  1352  	 * protocol about open/close status (connect/disconnect).
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1353  	 */
266e37efbc28b05 drivers/usb/gadget/u_serial.c          Jiri Slaby                2012-04-02  1354  	if (port->port.count) {
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1355  		pr_debug("gserial_connect: start ttyGS%d\n", port->port_num);
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1356  		gs_start_io(port);
1f1ba11b6494705 drivers/usb/gadget/u_serial.c          David Brownell            2008-08-06  1357  		if (gser->connect)
1f1ba11b6494705 drivers/usb/gadget/u_serial.c          David Brownell            2008-08-06  1358  			gser->connect(gser);
1f1ba11b6494705 drivers/usb/gadget/u_serial.c          David Brownell            2008-08-06  1359  	} else {
1f1ba11b6494705 drivers/usb/gadget/u_serial.c          David Brownell            2008-08-06  1360  		if (gser->disconnect)
1f1ba11b6494705 drivers/usb/gadget/u_serial.c          David Brownell            2008-08-06  1361  			gser->disconnect(gser);
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1362  	}
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1363
e273a647995aac7 drivers/usb/gadget/function/u_serial.c Micha?? Miros??aw           2019-07-22  1364  	status = gs_console_connect(port);
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1365  	spin_unlock_irqrestore(&port->port_lock, flags);
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1366
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1367  	return status;
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1368
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1369  fail_out:
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1370  	usb_ep_disable(gser->in);
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1371  	return status;
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1372  }
3249ca22c088c28 drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1373  EXPORT_SYMBOL_GPL(gserial_connect);
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1374  /**
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1375   * gserial_disconnect - notify TTY I/O glue that USB link is inactive
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1376   * @gser: the function, on which gserial_connect() was called
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1377   * Context: any (usually from irq)
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1378   *
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1379   * This is called to deactivate endpoints and let the TTY layer know
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1380   * that the connection went inactive ... not unlike "hangup".
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1381   *
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1382   * On return, the state is as if gserial_connect() had never been called;
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1383   * there is no active USB I/O on these endpoints.
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1384   */
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1385  void gserial_disconnect(struct gserial *gser)
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1386  {
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1387  	struct gs_port	*port = gser->ioport;
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1388  	unsigned long	flags;
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1389
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1390  	if (!port)
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1391  		return;
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1392
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1393  	/* tell the TTY glue not to do I/O here any more */
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1394  	spin_lock_irqsave(&port->port_lock, flags);
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1395
e273a647995aac7 drivers/usb/gadget/function/u_serial.c Micha?? Miros??aw           2019-07-22  1396  	gs_console_disconnect(port);
e273a647995aac7 drivers/usb/gadget/function/u_serial.c Micha?? Miros??aw           2019-07-22  1397
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1398  	/* REVISIT as above: how best to track this? */
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1399  	port->port_line_coding = gser->port_line_coding;
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1400
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1401  	port->port_usb = NULL;
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1402  	gser->ioport = NULL;
266e37efbc28b05 drivers/usb/gadget/u_serial.c          Jiri Slaby                2012-04-02  1403  	if (port->port.count > 0 || port->openclose) {
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1404  		wake_up_interruptible(&port->drain_wait);
35f95fd7f234d2b drivers/usb/gadget/u_serial.c          Jiri Slaby                2012-04-02  1405  		if (port->port.tty)
35f95fd7f234d2b drivers/usb/gadget/u_serial.c          Jiri Slaby                2012-04-02  1406  			tty_hangup(port->port.tty);
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1407  	}
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1408  	spin_unlock_irqrestore(&port->port_lock, flags);
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1409
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1410  	/* disable endpoints, aborting down any active I/O */
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1411  	usb_ep_disable(gser->out);
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1412  	usb_ep_disable(gser->in);
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1413
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1414  	/* finally, free any unused/unusable I/O buffers */
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1415  	spin_lock_irqsave(&port->port_lock, flags);
266e37efbc28b05 drivers/usb/gadget/u_serial.c          Jiri Slaby                2012-04-02  1416  	if (port->port.count == 0 && !port->openclose)
a622ee9972aa42d drivers/usb/gadget/function/u_serial.c Lu Baolu                  2017-11-28  1417  		kfifo_free(&port->port_write_buf);
28609d4083bcd48 drivers/usb/gadget/u_serial.c          Jim Sung                  2010-11-04  1418  	gs_free_requests(gser->out, &port->read_pool, NULL);
28609d4083bcd48 drivers/usb/gadget/u_serial.c          Jim Sung                  2010-11-04  1419  	gs_free_requests(gser->out, &port->read_queue, NULL);
28609d4083bcd48 drivers/usb/gadget/u_serial.c          Jim Sung                  2010-11-04  1420  	gs_free_requests(gser->in, &port->write_pool, NULL);
28609d4083bcd48 drivers/usb/gadget/u_serial.c          Jim Sung                  2010-11-04  1421
28609d4083bcd48 drivers/usb/gadget/u_serial.c          Jim Sung                  2010-11-04  1422  	port->read_allocated = port->read_started =
28609d4083bcd48 drivers/usb/gadget/u_serial.c          Jim Sung                  2010-11-04  1423  		port->write_allocated = port->write_started = 0;
28609d4083bcd48 drivers/usb/gadget/u_serial.c          Jim Sung                  2010-11-04  1424
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1425  	spin_unlock_irqrestore(&port->port_lock, flags);
c1dca562be8ada6 drivers/usb/gadget/u_serial.c          David Brownell            2008-06-19  1426  }
3249ca22c088c28 drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1427  EXPORT_SYMBOL_GPL(gserial_disconnect);
3249ca22c088c28 drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1428
38b3ad5655e7b2c drivers/usb/gadget/u_serial.c          Felipe Balbi              2013-01-18  1429  static int userial_init(void)
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1430  {
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1431  	unsigned			i;
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1432  	int				status;
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1433
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1434  	gs_tty_driver = alloc_tty_driver(MAX_U_SERIAL_PORTS);
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1435  	if (!gs_tty_driver)
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1436  		return -ENOMEM;
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1437
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1438  	gs_tty_driver->driver_name = "g_serial";
c572a217d1b8120 drivers/usb/gadget/function/u_serial.c Richard Leitner           2014-08-21  1439  	gs_tty_driver->name = "ttyGS";
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1440  	/* uses dynamically assigned dev_t values */
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1441
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1442  	gs_tty_driver->type = TTY_DRIVER_TYPE_SERIAL;
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1443  	gs_tty_driver->subtype = SERIAL_TYPE_NORMAL;
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1444  	gs_tty_driver->flags = TTY_DRIVER_REAL_RAW | TTY_DRIVER_DYNAMIC_DEV;
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1445  	gs_tty_driver->init_termios = tty_std_termios;
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1446
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1447  	/* 9600-8-N-1 ... matches defaults expected by "usbser.sys" on
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1448  	 * MS-Windows.  Otherwise, most of these flags shouldn't affect
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1449  	 * anything unless we were to actually hook up to a serial line.
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1450  	 */
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1451  	gs_tty_driver->init_termios.c_cflag =
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1452  			B9600 | CS8 | CREAD | HUPCL | CLOCAL;
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1453  	gs_tty_driver->init_termios.c_ispeed = 9600;
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1454  	gs_tty_driver->init_termios.c_ospeed = 9600;
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1455
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1456  	tty_set_operations(gs_tty_driver, &gs_tty_ops);
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1457  	for (i = 0; i < MAX_U_SERIAL_PORTS; i++)
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1458  		mutex_init(&ports[i].lock);
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1459
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1460  	/* export the driver ... */
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1461  	status = tty_register_driver(gs_tty_driver);
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1462  	if (status) {
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1463  		pr_err("%s: cannot register, err %d\n",
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1464  				__func__, status);
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1465  		goto fail;
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1466  	}
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1467
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1468  	pr_debug("%s: registered %d ttyGS* device%s\n", __func__,
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1469  			MAX_U_SERIAL_PORTS,
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1470  			(MAX_U_SERIAL_PORTS == 1) ? "" : "s");
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1471
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1472  	return status;
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1473  fail:
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1474  	put_tty_driver(gs_tty_driver);
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1475  	gs_tty_driver = NULL;
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1476  	return status;
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1477  }
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1478  module_init(userial_init);
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1479
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1480  static void userial_cleanup(void)
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1481  {
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1482  	tty_unregister_driver(gs_tty_driver);
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1483  	put_tty_driver(gs_tty_driver);
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1484  	gs_tty_driver = NULL;
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1485  }
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1486  module_exit(userial_cleanup);
19b10a8828a6cdd drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1487
3249ca22c088c28 drivers/usb/gadget/u_serial.c          Sebastian Andrzej Siewior 2012-12-23  1488  MODULE_LICENSE("GPL");

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
